# defmodule Wabanex.Trainings do
#   import Ecto.Query, warn: false
#   alias Wabanex.Repo
#   alias Wabanex.Training

#   def list_trainings do
#     Repo.all(Training)
#   end

#   def get_training!(id), do: Repo.get!(Training, id)

#   def create_training(attrs \\ %{}) do
#     %Training{}
#     |> Training.changeset(attrs)
#     |> Repo.insert()
#   end

#   def update_training(%Training{} = training, attrs) do
#     training
#     |> Training.changeset(attrs)
#     |> Repo.update()
#   end

#   def delete_training(%Training{} = training) do
#     Repo.delete(training)
#   end

#   def change_training(%Training{} = training, attrs \\ %{}) do
#     Training.changeset(training, attrs)
#   end
# end
