defmodule CarServiceWeb.BrandController do
  use CarServiceWeb, :controller

  alias CarService.CarBrand
  alias CarService.CarBrand.Brand

  action_fallback CarServiceWeb.FallbackController

  def all_brands(conn, _params) do
    brands = CarBrand.list_brands()
    render(conn, "index.json", brands: brands)
  end

  def create(conn, %{"brand" => brand_params}) do
    with {:ok, %Brand{} = brand} <- CarBrand.create_brand(brand_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.brand_path(conn, :show, brand))
      |> render("show.json", brand: brand)
    end
  end

  def show(conn, %{"id" => id}) do
    brand = CarBrand.get_brand!(id)
    render(conn, "show.json", brand: brand)
  end

  def update(conn, %{"id" => id, "brand" => brand_params}) do
    brand = CarBrand.get_brand!(id)

    with {:ok, %Brand{} = brand} <- CarBrand.update_brand(brand, brand_params) do
      render(conn, "show.json", brand: brand)
    end
  end

  def delete(conn, %{"id" => id}) do
    brand = CarBrand.get_brand!(id)

    with {:ok, %Brand{}} <- CarBrand.delete_brand(brand) do
      send_resp(conn, :no_content, "")
    end
  end
end
