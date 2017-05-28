# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :talon_demo,
  ecto_repos: [TalonDemo.Repo]

# Configures the endpoint
config :talon_demo, TalonDemo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "v0xGNJKaKveEgSflOiYC4Y4vsO9aDR8TwedYuki5mt9yQef28bYVVFPwnbVV/C9+",
  render_errors: [view: TalonDemo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TalonDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"



import_config "talon.exs"

