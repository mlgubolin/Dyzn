defmodule DyznWeb.PageController do
  use DyznWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
