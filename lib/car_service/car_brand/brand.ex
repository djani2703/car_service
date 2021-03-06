defmodule CarService.CarBrand.Brand do
  @moduledoc "Brands schema code"

  use Ecto.Schema
  import Ecto.Changeset
  alias CarService.CarInfo.Car

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "brands" do
    field :name, :string, null: false
    has_many :cars, Car, foreign_key: :brand_id

    timestamps()
  end

  @doc false
  def changeset(brand, attrs) do
    brand
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name, name: :index_for_unique_name)
  end
end
