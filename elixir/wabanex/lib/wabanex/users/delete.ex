defmodule Wabanex.Users.Delete do
  @moduledoc """
  Delete Users.
  """

  alias Wabanex.{Repo, User}

  def call(id) do
    user = Repo.get(User, id)

    user
    |> Repo.delete()
  end
end
