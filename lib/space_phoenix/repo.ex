defmodule SpacePhoenix.Repo do
  use Ecto.Repo,
    otp_app: :space_phoenix,
    adapter: Ecto.Adapters.Postgres
end
