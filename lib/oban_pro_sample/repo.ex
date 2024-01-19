defmodule ObanProSample.Repo do
  use Ecto.Repo,
    otp_app: :oban_pro_sample,
    adapter: Ecto.Adapters.Postgres
end
