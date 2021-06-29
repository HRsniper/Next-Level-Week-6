defmodule Wabanex.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :name, :string
      add :youtube_video_url, :string
      add :protocol_description, :string
      add :repetitions, :string
      add :training_id, references(:trainings, on_delete: :delete_all, on_update: :update_all)

      timestamps()
    end

    create index(:exercises, [:training_id])
  end
end
