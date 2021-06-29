defmodule Wabanex.Repo.Migrations.CreateTrainings do
  use Ecto.Migration

  def change do
    create table(:trainings) do
      add :start_date, :date
      add :end_date, :date
      add :user_id, references(:users, on_delete: :delete_all, on_update: :update_all)

      timestamps()
    end

    create index(:trainings, [:user_id])
  end
end
