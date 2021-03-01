defmodule DyznMusic.FoldersTest do
  use DyznMusic.DataCase

  alias DyznMusic.Folders

  describe "folder" do
    alias DyznMusic.Folders.Folder

    @valid_attrs %{path: "some folders"}
    @update_attrs %{path: "some updated folders"}
    @invalid_attrs %{path: nil}

    def folder_fixture(attrs \\ %{}) do
      {:ok, folder} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Folders.add_folder()

      folder
    end

    test "list_folder/0 returns all folder" do
      folder = folder_fixture()
      assert Folders.list_folder() == [folder]
    end

    test "get_folder!/1 returns the folder with given id" do
      folder = folder_fixture()
      assert Folders.get_folder!(folder.id) == folder
    end

    test "add_folder/1 with valid data creates a folder" do
      assert {:ok, %Folder{} = folder} = Folders.add_folder(@valid_attrs)
      assert folder.folders == "some folders"
    end

    test "add_folder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Folders.add_folder(@invalid_attrs)
    end

    test "update_folder/2 with valid data updates the folder" do
      folder = folder_fixture()
      assert {:ok, %Folder{} = folder} = Folders.update_folder(folder, @update_attrs)
      assert folder.folders == "some updated folders"
    end

    test "update_folder/2 with invalid data returns error changeset" do
      folder = folder_fixture()
      assert {:error, %Ecto.Changeset{}} = Folders.update_folder(folder, @invalid_attrs)
      assert folder == Folders.get_folder!(folder.id)
    end

    test "delete_folder/1 deletes the folder" do
      folder = folder_fixture()
      assert {:ok, %Folder{}} = Folders.delete_folder(folder)
      assert_raise Ecto.NoResultsError, fn -> Folders.get_folder!(folder.id) end
    end

    test "change_folder/1 returns a folder changeset" do
      folder = folder_fixture()
      assert %Ecto.Changeset{} = Folders.change_folder(folder)
    end
  end
end
