defmodule Wabanex.Users.Update do
  @moduledoc """
  Update Users.
  """

  alias Wabanex.{Repo, User}

  def call(id, params) do
    user = Repo.get(User, id)

    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
