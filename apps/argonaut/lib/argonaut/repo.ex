defmodule Argonaut.Repo do
  use Ecto.Repo,
    otp_app: :argonaut,
    adapter: Ecto.Adapters.Postgres
end
