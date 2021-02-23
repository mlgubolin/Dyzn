defmodule DyznMusicWeb.XmlControllerTest do
  use DyznMusicWeb.ConnCase

  alias DyznMusic.XML

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:xml) do
    {:ok, xml} = XML.create_xml(@create_attrs)
    xml
  end

  describe "index" do
    test "lists all xmls", %{conn: conn} do
      conn = get(conn, Routes.xml_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Xmls"
    end
  end

  describe "new xml" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.xml_path(conn, :new))
      assert html_response(conn, 200) =~ "New Xml"
    end
  end

  describe "create xml" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.xml_path(conn, :create), xml: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.xml_path(conn, :show, id)

      conn = get(conn, Routes.xml_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Xml"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.xml_path(conn, :create), xml: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Xml"
    end
  end

  describe "edit xml" do
    setup [:create_xml]

    test "renders form for editing chosen xml", %{conn: conn, xml: xml} do
      conn = get(conn, Routes.xml_path(conn, :edit, xml))
      assert html_response(conn, 200) =~ "Edit Xml"
    end
  end

  describe "update xml" do
    setup [:create_xml]

    test "redirects when data is valid", %{conn: conn, xml: xml} do
      conn = put(conn, Routes.xml_path(conn, :update, xml), xml: @update_attrs)
      assert redirected_to(conn) == Routes.xml_path(conn, :show, xml)

      conn = get(conn, Routes.xml_path(conn, :show, xml))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, xml: xml} do
      conn = put(conn, Routes.xml_path(conn, :update, xml), xml: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Xml"
    end
  end

  describe "delete xml" do
    setup [:create_xml]

    test "deletes chosen xml", %{conn: conn, xml: xml} do
      conn = delete(conn, Routes.xml_path(conn, :delete, xml))
      assert redirected_to(conn) == Routes.xml_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.xml_path(conn, :show, xml))
      end
    end
  end

  defp create_xml(_) do
    xml = fixture(:xml)
    %{xml: xml}
  end
end
