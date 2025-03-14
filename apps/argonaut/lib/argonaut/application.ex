defmodule Argonaut.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Argonaut.Repo,
      {DNSCluster, query: Application.get_env(:argonaut, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Argonaut.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Argonaut.Finch}
      # Start a worker by calling: Argonaut.Worker.start_link(arg)
      # {Argonaut.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Argonaut.Supervisor)
  end
end
