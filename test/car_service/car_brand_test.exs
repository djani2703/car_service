defmodule CarService.CarBrandTest do
  use CarService.DataCase

  alias CarService.CarBrand

  describe "brands" do
    alias CarService.CarBrand.Brand

    import CarService.CarBrandFixtures

    @invalid_attrs %{name: nil}

    test "list_brands/0 returns all brands" do
      brand = brand_fixture()
      assert CarBrand.list_brands() == [brand]
    end

    test "get_brand!/1 returns the brand with given id" do
      brand = brand_fixture()
      assert CarBrand.get_brand!(brand.id) == brand
    end

    test "create_brand/1 with valid data creates a brand" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Brand{} = brand} = CarBrand.create_brand(valid_attrs)
      assert brand.name == "some name"
    end

    test "create_brand/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CarBrand.create_brand(@invalid_attrs)
    end

    test "update_brand/2 with valid data updates the brand" do
      brand = brand_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Brand{} = brand} = CarBrand.update_brand(brand, update_attrs)
      assert brand.name == "some updated name"
    end

    test "update_brand/2 with invalid data returns error changeset" do
      brand = brand_fixture()
      assert {:error, %Ecto.Changeset{}} = CarBrand.update_brand(brand, @invalid_attrs)
      assert brand == CarBrand.get_brand!(brand.id)
    end

    test "delete_brand/1 deletes the brand" do
      brand = brand_fixture()
      assert {:ok, %Brand{}} = CarBrand.delete_brand(brand)
      assert_raise Ecto.NoResultsError, fn -> CarBrand.get_brand!(brand.id) end
    end

    test "change_brand/1 returns a brand changeset" do
      brand = brand_fixture()
      assert %Ecto.Changeset{} = CarBrand.change_brand(brand)
    end
  end
end
