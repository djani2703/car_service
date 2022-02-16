defmodule CarServiceWeb.PageControllerTest do
  use CarServiceWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert json_response(conn, 200)["data"] == "Car service start page"
  end

  test "Undefined url GET response", %{conn: conn} do
    conn = get(conn, "/some_url")
    assert json_response(conn, 200)["error"] == "Page not found.."
  end
end
