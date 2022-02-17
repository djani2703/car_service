defmodule CarService.CarInfo do
  @moduledoc """
  The CarInfo context.
  """

  import Ecto.Query, warn: false
  alias CarService.Repo

  alias CarService.CarInfo.Car

  @doc """
  Returns the list of cars.

  ## Examples

      iex> list_cars()
      [%Car{}, ...]

  """
  def list_cars do
    query = from(c in Car, join: b in assoc(c, :brand), preload: [brand: b])
    Repo.all(query)
  end

  @doc """
  Returns a filtered list of cars.

  ## Examples

      iex> list_cars(%{"brand" => "Audi", "body_type" => "coupe", "is_electric" => false})
      [%Car{}, ...]

      iex> list_cars(%{"is_electric" => false})
      [%Car{}, ...]

  """
  def list_cars(%{"brand" => brand, "body_type" => body_type, "is_electric" => is_electric}) do
    query =
      from c in Car,
        join: b in assoc(c, :brand),
        where: c.body_type == ^body_type and c.is_electric == ^is_electric and b.name == ^brand,
        preload: [brand: b]

    Repo.all(query)
  end

  def list_cars(%{"is_electric" => is_electric}) do
    query =
      from c in Car,
        join: b in assoc(c, :brand),
        where: c.is_electric == ^is_electric,
        preload: [brand: b]

    Repo.all(query)
  end

  @doc """
  Gets a single car.

  Raises `Ecto.NoResultsError` if the Car does not exist.

  ## Examples

      iex> get_car!(123)
      %Car{}

      iex> get_car!(456)
      ** (Ecto.NoResultsError)

  """
  def get_car!(id) do
    Car
    |> Repo.get!(id)
    |> Repo.preload(:brand)
  end

  @doc """
  Creates a car.

  ## Examples

      iex> create_car(%{field: value})
      {:ok, %Car{}}

      iex> create_car(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """

  # def create_car(attrs \\ %{}) do
  #   {:ok, %Car{} = new_car} =
  #     %Car{}
  #     |> Car.changeset(attrs)
  #     |> Repo.insert()

  #   {:ok, Repo.preload(new_car, :brand)}
  # end

  def create_car(attrs \\ %{}) do
    %Car{}
    |> Car.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, %Car{} = new_car} ->
        {:ok, Repo.preload(new_car, :brand)}

      {:error, _} = err ->
        err
    end
  end

  @doc """
  Updates a car.

  ## Examples

      iex> update_car(car, %{field: new_value})
      {:ok, %Car{}}

      iex> update_car(car, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_car(%Car{} = car, attrs) do
    car
    |> Car.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a car.

  ## Examples

      iex> delete_car(car)
      {:ok, %Car{}}

      iex> delete_car(car)
      {:error, %Ecto.Changeset{}}

  """
  def delete_car(%Car{} = car) do
    Repo.delete(car)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking car changes.

  ## Examples

      iex> change_car(car)
      %Ecto.Changeset{data: %Car{}}

  """
  def change_car(%Car{} = car, attrs \\ %{}) do
    Car.changeset(car, attrs)
  end
end
