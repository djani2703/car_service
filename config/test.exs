import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :car_service, CarService.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "car_service_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :car_service, CarServiceWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "0M371IfoW5dH9JrVFKogUD6qcLpBwl2izznPuxDe7iFO09JTQ7NAMlf0mn372CkK",
  server: false

# In test we don't send emails.
config :car_service, CarService.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
