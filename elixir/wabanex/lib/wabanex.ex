defmodule Wabanex do
  @moduledoc """
  Wabanex keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Wabanex.Users.{CheckChange, Create, Delete, Get, List, Update}

  defdelegate create_user(params), to: Create, as: :call
  defdelegate check_change(user, params \\ %{}), to: CheckChange, as: :call
  defdelegate delete_user(id), to: Delete, as: :call
  defdelegate get_user(id), to: Get, as: :call
  defdelegate list_all_users(), to: List, as: :call
  defdelegate update_user(id, params), to: Update, as: :call
end
