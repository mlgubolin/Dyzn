defmodule DyznMusic.Repo do
  use Ecto.Repo,
    otp_app: :dyznmusic,
    adapter: Ecto.Adapters.Postgres
end
