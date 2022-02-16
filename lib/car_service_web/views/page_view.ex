defmodule CarServiceWeb.PageView do
  use CarServiceWeb, :view

  def render("main_page.json", _), do: %{data: "Car service start page"}

  def render("not_found.json", _), do: %{error: "Page not found.."}
end
