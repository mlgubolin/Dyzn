defmodule DyznMusic.Folders do
  @moduledoc """
  The Folders context.
  """

  import Ecto.Query, warn: false
  alias DyznMusic.Repo

  alias DyznMusic.Folders.Folder
  alias DyznMusic.Musics

  @doc """
  Returns the list of folder.

  ## Examples

      iex> list_folder()
      [%Folder{}, ...]

  """
  def list_folder do
    Repo.all(Folder)
  end

  @doc """
  Gets a single folder.

  Raises `Ecto.NoResultsError` if the Folder does not exist.

  ## Examples

      iex> get_folder!(123)
      %Folder{}

      iex> get_folder!(456)
      ** (Ecto.NoResultsError)

  """
  def get_folder!(id), do: Repo.get!(Folder, id)

  @doc """
  Creates a folder.

  ## Examples

      iex> create_folder(%{field: value})
      {:ok, %Folder{}}

      iex> create_folder(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def add_folder(attrs \\ %{}) do
    %Folder{}
    |> Folder.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a folder.

  ## Examples

      iex> update_folder(folder, %{field: new_value})
      {:ok, %Folder{}}

      iex> update_folder(folder, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_folder(%Folder{} = folder, attrs) do
    folder
    |> Folder.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a folder.

  ## Examples

      iex> delete_folder(folder)
      {:ok, %Folder{}}

      iex> delete_folder(folder)
      {:error, %Ecto.Changeset{}}

  """
  def delete_folder(%Folder{} = folder) do
    Repo.delete(folder)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking folder changes.

  ## Examples

      iex> change_folder(folder)
      %Ecto.Changeset{data: %Folder{}}

  """
  def change_folder(%Folder{} = folder, attrs \\ %{}) do
    Folder.changeset(folder, attrs)
  end

  def list_folder(dir, music_extentions) do
    file_list = File.ls!(dir)

    for path <- file_list do
      if File.dir?(path) do
        add_folder(%Folder{path: path})
        list_folder(path, music_extentions)
      else
        IO.puts(:stdio, [path])
        Musics.create_music(path, music_extentions)
      end
    end
  end
end
