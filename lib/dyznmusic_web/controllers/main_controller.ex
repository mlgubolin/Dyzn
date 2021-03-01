defmodule DyznMusicWeb.MainController do
  use DyznMusicWeb, :controller
  alias DyznMusic.XML

  def ping(conn, _params) do
    xml_body = ""

    conn
    |> Plug.Conn.put_resp_content_type("application/xml")
    |> render_xml("index.html", xml_body)
  end

  def getLicense(conn, _params) do
    xml_body = "<license valid=\"true\" licenseExpires=\"never, dyzn is free :)\""

    conn
    |> Plug.Conn.put_resp_content_type("application/xml")
    |> render_xml("index.html", xml_body)
  end

  defp render_xml(conn, html_file, xml_body) do
    render(conn, html_file,
      xml_header: XML.return_header(current_url(conn), "ok", "0.0.1"),
      xml_body: xml_body,
      xml_footer: XML.return_footer()
    )
  end
end
