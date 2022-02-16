defmodule CarServiceWeb.PageController do
  use CarServiceWeb, :controller

  def index(conn, _params) do
    render(conn, "main_page.json")
  end

  def not_found(conn, _) do
    render(conn, "not_found.json")
  end
end
