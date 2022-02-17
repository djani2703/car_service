defmodule CarService.CarInfo.Car do
  @moduledoc "Cars schema code"

  use Ecto.Schema
  import Ecto.Changeset
  alias CarService.CarBrand.Brand

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "cars" do
    field :model, :string, null: false
    field :year, :integer

    field :body_type, Ecto.Enum,
      values: [:sedan, :coupe, :hatchback, :convertible, :minivan, :pickup]

    field :is_electric, :boolean

    belongs_to :brand, Brand, foreign_key: :brand_id, type: :binary_id

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:model, :brand_id, :year, :body_type, :is_electric])
    |> validate_required([:model, :brand_id, :year, :body_type, :is_electric])
    |> validate_number(:year, greater_than_or_equal_to: 1866, less_than: 2023)
    |> assoc_constraint(:brand)
  end
end
