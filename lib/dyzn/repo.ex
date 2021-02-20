defmodule Dyzn.Repo do
  use Ecto.Repo,
    otp_app: :dyzn,
    adapter: Ecto.Adapters.Postgres
end
