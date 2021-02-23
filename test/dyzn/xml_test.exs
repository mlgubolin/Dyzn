defmodule DyznMusic.XMLTest do
  use DyznMusic.DataCase

  alias DyznMusic.XML

  describe "xmls" do
    alias DyznMusic.XML.Xml

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def xml_fixture(attrs \\ %{}) do
      {:ok, xml} =
        attrs
        |> Enum.into(@valid_attrs)
        |> XML.create_xml()

      xml
    end

    test "list_xmls/0 returns all xmls" do
      xml = xml_fixture()
      assert XML.list_xmls() == [xml]
    end

    test "get_xml!/1 returns the xml with given id" do
      xml = xml_fixture()
      assert XML.get_xml!(xml.id) == xml
    end

    test "create_xml/1 with valid data creates a xml" do
      assert {:ok, %Xml{} = xml} = XML.create_xml(@valid_attrs)
    end

    test "create_xml/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = XML.create_xml(@invalid_attrs)
    end

    test "update_xml/2 with valid data updates the xml" do
      xml = xml_fixture()
      assert {:ok, %Xml{} = xml} = XML.update_xml(xml, @update_attrs)
    end

    test "update_xml/2 with invalid data returns error changeset" do
      xml = xml_fixture()
      assert {:error, %Ecto.Changeset{}} = XML.update_xml(xml, @invalid_attrs)
      assert xml == XML.get_xml!(xml.id)
    end

    test "delete_xml/1 deletes the xml" do
      xml = xml_fixture()
      assert {:ok, %Xml{}} = XML.delete_xml(xml)
      assert_raise Ecto.NoResultsError, fn -> XML.get_xml!(xml.id) end
    end

    test "change_xml/1 returns a xml changeset" do
      xml = xml_fixture()
      assert %Ecto.Changeset{} = XML.change_xml(xml)
    end
  end
end
