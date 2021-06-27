defmodule Wabanex.Trainings.Get do
  @moduledoc """
  Get Trainings.
  """

  alias Wabanex.{Repo, Training}

  def call(id) do
    id
    |> Repo.get!(Training, id)
  end
end
