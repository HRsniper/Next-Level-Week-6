defmodule Wabanex.Users.Create do
  @moduledoc """
  Create Users.
  """

  alias Wabanex.{Repo, User}

  def call(params \\ %{}) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
