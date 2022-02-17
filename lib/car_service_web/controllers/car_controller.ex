defmodule CarServiceWeb.CarController do
  use CarServiceWeb, :controller

  alias CarService.CarInfo
  alias CarService.CarInfo.Car

  action_fallback CarServiceWeb.FallbackController

  def all_cars(conn, params) do
    cars =
      case params do
        %{"brand" => _brand, "body_type" => _body, "is_electric" => _electric} ->
          CarInfo.list_cars(params)

        %{"is_electric" => _electric} ->
          CarInfo.list_cars(params)

        %{} ->
          CarInfo.list_cars()
      end

    render(conn, "index.json", cars: cars)
  end

  def create(conn, %{"car" => car_params}) do
    with {:ok, %Car{} = car} <- CarInfo.create_car(car_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.car_path(conn, :show, car))
      |> render("show.json", car: car)
    end
  end

  def show(conn, %{"id" => id}) do
    car = CarInfo.get_car!(id)
    render(conn, "show.json", car: car)
  end

  def update(conn, %{"id" => id, "car" => car_params}) do
    car = CarInfo.get_car!(id)

    with {:ok, %Car{} = car} <- CarInfo.update_car(car, car_params) do
      render(conn, "show.json", car: car)
    end
  end

  def delete(conn, %{"id" => id}) do
    car = CarInfo.get_car!(id)

    with {:ok, %Car{}} <- CarInfo.delete_car(car) do
      send_resp(conn, :no_content, "")
    end
  end
end
