defmodule RenovateTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RenovateTestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RenovateTest.PubSub},
      # Start the Endpoint (http/https)
      RenovateTestWeb.Endpoint
      # Start a worker by calling: RenovateTest.Worker.start_link(arg)
      # {RenovateTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RenovateTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RenovateTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
