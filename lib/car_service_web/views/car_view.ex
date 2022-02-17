defmodule CarServiceWeb.CarView do
  use CarServiceWeb, :view
  alias CarServiceWeb.CarView

  def render("index.json", %{cars: cars}) do
    %{data: render_many(cars, CarView, "car.json")}
  end

  def render("show.json", %{car: car}) do
    %{data: render_one(car, CarView, "car.json")}
  end

  def render("car.json", %{car: car}) do
    %{
      id: car.id,
      brand: car.brand.name,
      model: car.model,
      year: car.year,
      body_type: car.body_type,
      is_electric: car.is_electric
    }
  end
end
