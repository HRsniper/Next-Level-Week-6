defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{email: "hr@email.com", name: "hr", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "hr@email.com", name: "hr", password: "123456"},
               errors: []
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{email: "hr@email.com", name: "h", password: "12345"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               changes: %{email: "hr@email.com", name: "h", password: "12345"},
               errors: [
                 password:
                   {"should be at least %{count} character(s)",
                    [count: 6, validation: :length, kind: :min, type: :string]},
                 name:
                   {"should be at least %{count} character(s)",
                    [count: 2, validation: :length, kind: :min, type: :string]}
               ],
               valid?: false
             } = response
    end

    test "when there are invalid params, returns an error (erros_on)" do
      params = %{email: "hr@email.com", name: "h", password: "12345"}

      response = User.changeset(params)

      expect_response = %{
        name: ["should be at least 2 character(s)"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expect_response
    end
  end
end
