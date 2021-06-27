defmodule Wabanex.Trainings.Create do
  @moduledoc """
  Create Trainings.
  """

  alias Wabanex.{Repo, Training}

  def call(params \\ %{}) do
    params
    |> Training.changeset()
    |> Repo.insert()
  end
end
