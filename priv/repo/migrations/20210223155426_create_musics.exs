defmodule Dyzn.Repo.Migrations.CreateMusics do
  use Ecto.Migration

  def change do
    create table(:musics) do
      add :path, :string
      add :type, :string

      timestamps()
    end

  end
end
