defmodule CarService.CarInfoFixtures do
  import CarService.CarBrandFixtures

  @moduledoc """
  This module defines test helpers for creating
  entities via the `CarService.CarInfo` context.
  """

  @doc """
  Generate a car.
  """
  def car_fixture(attrs \\ %{}) do
    brand = brand_fixture()

    {:ok, car} =
      attrs
      |> Map.put(:brand_id, brand.id)
      |> Enum.into(%{})
      |> CarService.CarInfo.create_car()

    car
  end
end
