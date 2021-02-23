defmodule DyznMusic.Repo.Migrations.CreateXmls do
  use Ecto.Migration

  def change do
    create table(:xmls) do

      timestamps()
    end

  end
end
