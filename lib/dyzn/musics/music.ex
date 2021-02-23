defmodule Dyzn.Musics.Music do
  use Ecto.Schema
  import Ecto.Changeset

  schema "musics" do
    field :path, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(music, attrs) do
    music
    |> cast(attrs, [:path, :type])
    |> validate_required([:path, :type])
  end
end
