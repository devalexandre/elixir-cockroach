defmodule Cockroachdb do
  @moduledoc """
  Documentation for `Cockroachdb`.

  """

  alias Cockroachdb.Users

  def find_all do
    query("SELECT * FROM users")
    |> Users.parse()
  end

  def insert(%Users{} = user) do
    query(
      "INSERT INTO users (username, password, email, name) VALUES ('#{user.username}','#{user.password}','#{user.email}', '#{user.name}')"
    )
  end

  defp query(sql, params \\ []) do
    Postgrex.query!(:cockroachlabs, sql, params)
  end
end
