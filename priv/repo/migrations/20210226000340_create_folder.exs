defmodule DyznMusic.Repo.Migrations.CreateFolder do
  use Ecto.Migration

  def change do
    create table(:folder) do
      add :path, :string

      timestamps()
    end
  end
end
