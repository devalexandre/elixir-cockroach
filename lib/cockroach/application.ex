defmodule Cockroach.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    db_config = [
      name: :cockroachlabs,
      username: "alexandre",
      password: "0eNlgMJjpPtdUy-KYWhYkg",
      database: "defaultdb",
      port: "26257",
      hostname: "free-tier14.aws-us-east-1.cockroachlabs.cloud",
      ssl: true,
      ssl_opts: [
        cacertfile: Path.expand("priv/certs/ca-cert.crt")
      ],
      parameters: [options: "--cluster=melissa-920"]
    ]

    children = [
      {Postgrex, db_config}
      # Starts a worker by calling: Cockroach.Worker.start_link(arg)
      # {Cockroach.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cockroach.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
