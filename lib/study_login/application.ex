defmodule StudyLogin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      StudyLoginWeb.Telemetry,
      # Start the Ecto repository
      StudyLogin.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: StudyLogin.PubSub},
      # Start Finch
      {Finch, name: StudyLogin.Finch},
      # Start the Endpoint (http/https)
      StudyLoginWeb.Endpoint
      # Start a worker by calling: StudyLogin.Worker.start_link(arg)
      # {StudyLogin.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StudyLogin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StudyLoginWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
