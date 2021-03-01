defmodule DyznMusicWeb.PageView do
  use DyznMusicWeb, :view

  def render("index.html", params) do
    params.xml_header <> params.xml_body <> params.xml_footer
    |> Phoenix.HTML.raw()
  end
end
