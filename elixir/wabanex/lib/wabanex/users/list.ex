defmodule Wabanex.Users.List do
  @moduledoc """
  List All Users.
  """

  alias Wabanex.{Repo, User}

  def call() do
    Repo.all(User)
  end
end
