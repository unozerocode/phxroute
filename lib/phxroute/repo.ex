defmodule Phxroute.Repo do
  use Ecto.Repo,
    otp_app: :phxroute,
    adapter: Ecto.Adapters.Postgres
end
