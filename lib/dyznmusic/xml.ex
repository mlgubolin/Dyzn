defmodule DyznMusic.XML do
  @moduledoc """
  The XML context.
  """

  import Ecto.Query, warn: false

  def return_header(url, status, version) do
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?> \n <subsonic-response xmlns=\"#{url}\" status=\"#{
      status
    }\" version=\"#{version}\">"
  end

  def return_footer do
    "</subsonic-response>"
  end
end
