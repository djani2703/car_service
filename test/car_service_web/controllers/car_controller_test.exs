defmodule CarServiceWeb.CarControllerTest do
  use CarServiceWeb.ConnCase

  import CarService.CarBrandFixtures

  @create_attrs %{
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

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cars", %{conn: conn} do
      conn = get(conn, Routes.car_path(conn, :all_cars))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create car" do
    test "renders car when data is valid", %{conn: conn} do
      brand = brand_fixture()
      create_attrs = Map.put(@create_attrs, :brand_id, brand.id)

      conn = post(conn, Routes.car_path(conn, :create), car: create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.car_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      brand = brand_fixture()
      create_attrs = Map.put(@invalid_attrs, :brand_id, brand.id)

      conn = post(conn, Routes.car_path(conn, :create), car: create_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
