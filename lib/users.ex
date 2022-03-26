defmodule Cockroachdb.Users do
  defstruct id: "", username: "", password: "", email: "", name: ""

  def parse(result) do
    %Postgrex.Result{rows: rows} = result

    rows
    |> Enum.map(fn u -> prepare(u) end)
  end

  defp prepare(row) do
    [id, username, password, email, name] = row

    %Cockroachdb.Users{
      id: id,
      username: username,
      password: password,
      email: email,
      name: name
    }
  end
end
