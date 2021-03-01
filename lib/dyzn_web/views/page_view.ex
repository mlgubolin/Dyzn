defmodule DyznWeb.PageView do
  use DyznWeb, :view

  def render("index.html",params) do
    params.xml_header <> params.xml <> params.xml_footer
    |> Phoenix.HTML.raw()
  end
end
