defmodule DyznMusicWeb.PageView do
  use DyznMusicWeb, :view

  def render("index.html", params) do
    params.xml
    |> Phoenix.HTML.raw()

    # |> Phoenix.HTML.safe_to_string()
  end
end
