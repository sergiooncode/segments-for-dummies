defmodule Api.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :forbidden_mood, :string
      add :featured_mood, :string
      add :priority, :integer

      timestamps
    end

  end
end
