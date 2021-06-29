defmodule Wabanex.Users.CheckChange do
  @moduledoc """
  Is Changed Users.
  """

  alias Wabanex.User

  def call(%User{} = user, params \\ %{}) do
    User.changeset(user, params)
  end
end
