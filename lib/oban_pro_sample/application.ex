defmodule ObanProSample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ObanProSampleWeb.Telemetry,
      # Start the Ecto repository
      ObanProSample.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ObanProSample.PubSub},
      # Start Finch
      {Finch, name: ObanProSample.Finch},
      # Start the Endpoint (http/https)
      ObanProSampleWeb.Endpoint
      # Start a worker by calling: ObanProSample.Worker.start_link(arg)
      # {ObanProSample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ObanProSample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ObanProSampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
