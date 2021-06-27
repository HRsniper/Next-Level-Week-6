defmodule Wabanex.Users.Create do
  @moduledoc """
  CreateUsers.
  """

  alias Wabanex.{Repo, User}

  def call(params \\ %{}) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
