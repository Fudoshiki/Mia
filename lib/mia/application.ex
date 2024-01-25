defmodule Mia.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MiaWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:mia, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Mia.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Mia.Finch},
      # Start a worker by calling: Mia.Worker.start_link(arg)
      # {Mia.Worker, arg},
      # Start to serve requests, typically the last entry
      MiaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mia.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MiaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
