defmodule CarService.CarBrandFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CarService.CarBrand` context.
  """

  @doc """
  Generate a brand.
  """
  def brand_fixture(attrs \\ %{}) do
    {:ok, brand} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> CarService.CarBrand.create_brand()

    brand
  end
end
