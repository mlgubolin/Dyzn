defmodule DyznWeb.PageController do
  use DyznWeb, :controller
  alias Dyzn.XML

  def ping(conn,_params) do
    xml = XML.return_header(current_url(conn), "ok", "0.0.1")
    xml = xml <> conn.query_params["u"]
    xml = xml <> XML.return_footer()
    conn
    |> Plug.Conn.put_resp_content_type("application/xml")
    |> render("index.html", xml: xml)
  end

  def getLicense(conn,_params) do
    xml = XML.return_header(current_url(conn), "ok", "0.0.1")
    xml = xml <> "<license valid=\"true\" licenseExpires=\"never, dyzn is free :)\""
    conn
    |> Plug.Conn.put_resp_content_type("application/xml")
    |> render("index.html", xml: xml)
  end
end
