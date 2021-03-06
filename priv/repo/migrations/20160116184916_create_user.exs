defmodule Reactpxbp.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :pw_hash, :string

      timestamps
    end
    create unique_index(:users, [:email])

  end
end
