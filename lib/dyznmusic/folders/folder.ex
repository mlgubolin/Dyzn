defmodule DyznMusic.Folders.Folder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "folder" do
    field :path, :string

    timestamps()
  end

  @doc false
  def changeset(folder, attrs) do
    folder
    |> cast(attrs, [:folders])
    |> validate_required([:folders])
  end
end
