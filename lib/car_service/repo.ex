defmodule CarService.Repo do
  use Ecto.Repo,
    otp_app: :car_service,
    adapter: Ecto.Adapters.Postgres
end
