defmodule SpacePhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SpacePhoenixWeb.Telemetry,
      # Start the Ecto repository
      SpacePhoenix.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SpacePhoenix.PubSub},
      # Start the Endpoint (http/https)
      SpacePhoenixWeb.Endpoint
      # Start a worker by calling: SpacePhoenix.Worker.start_link(arg)
      # {SpacePhoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SpacePhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SpacePhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
