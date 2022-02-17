defmodule CarService.CarInfoTest do
  use CarService.DataCase

  alias CarService.CarInfo

  describe "cars" do
    alias CarService.CarInfo.Car

    import CarService.{CarInfoFixtures, CarBrandFixtures}

    @valid_attrs %{
      model: "X5",
      year: 2017,
      body_type: "sedan",
      is_electric: false
    }

    @invalid_attrs %{
      model: "X5",
      year: 1817,
      body_type: "sedan",
      is_electric: false
    }

    test "list_cars/0 returns all cars" do
      car = car_fixture(@valid_attrs)
      assert CarInfo.list_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture(@valid_attrs)
      assert CarInfo.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      brand = brand_fixture()
      attrs = Map.put(@valid_attrs, :brand_id, brand.id)
      assert {:ok, %Car{} = _car} = CarInfo.create_car(attrs)
    end

    test "create_car/1 with idvalid data - get error" do
      brand = brand_fixture()
      attrs = Map.put(@invalid_attrs, :brand_id, brand.id)
      assert {:error, _changeset} = CarInfo.create_car(attrs)
    end
  end
end
