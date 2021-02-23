defmodule Dyzn.MusicsTest do
  use Dyzn.DataCase

  alias Dyzn.Musics

  describe "musics" do
    alias Dyzn.Musics.Music

    @valid_attrs %{path: "some path", type: "some type"}
    @update_attrs %{path: "some updated path", type: "some updated type"}
    @invalid_attrs %{path: nil, type: nil}

    def music_fixture(attrs \\ %{}) do
      {:ok, music} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Musics.create_music()

      music
    end

    test "list_musics/0 returns all musics" do
      music = music_fixture()
      assert Musics.list_musics() == [music]
    end

    test "get_music!/1 returns the music with given id" do
      music = music_fixture()
      assert Musics.get_music!(music.id) == music
    end

    test "create_music/1 with valid data creates a music" do
      assert {:ok, %Music{} = music} = Musics.create_music(@valid_attrs)
      assert music.path == "some path"
      assert music.type == "some type"
    end

    test "create_music/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musics.create_music(@invalid_attrs)
    end

    test "update_music/2 with valid data updates the music" do
      music = music_fixture()
      assert {:ok, %Music{} = music} = Musics.update_music(music, @update_attrs)
      assert music.path == "some updated path"
      assert music.type == "some updated type"
    end

    test "update_music/2 with invalid data returns error changeset" do
      music = music_fixture()
      assert {:error, %Ecto.Changeset{}} = Musics.update_music(music, @invalid_attrs)
      assert music == Musics.get_music!(music.id)
    end

    test "delete_music/1 deletes the music" do
      music = music_fixture()
      assert {:ok, %Music{}} = Musics.delete_music(music)
      assert_raise Ecto.NoResultsError, fn -> Musics.get_music!(music.id) end
    end

    test "change_music/1 returns a music changeset" do
      music = music_fixture()
      assert %Ecto.Changeset{} = Musics.change_music(music)
    end
  end
end
