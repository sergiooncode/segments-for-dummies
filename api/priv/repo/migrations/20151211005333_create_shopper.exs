defmodule Api.Repo.Migrations.CreateShopper do
  use Ecto.Migration

  def change do
    create table(:shoppers) do
      add :name, :string
      add :mood, :string
      add :username, :string

      timestamps
    end

  end
end
