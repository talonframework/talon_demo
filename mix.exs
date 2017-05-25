defmodule TalonDemo.Mixfile do
  use Mix.Project

  def project do
    [app: :talon_demo,
     version: "0.0.1",
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
    #  compilers: [:phoenix, :gettext] ++ Mix.compilers,
     compilers: [:talon, :phoenix, :gettext] ++ Mix.compilers,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {TalonDemo, []},
     extra_applications: [:logger, :faker_elixir_octopus, :talon]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.3.0-rc", override: true},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.2"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     {:faker_elixir_octopus, "~> 0.12.0", only: [:dev, :test]},
     {:phoenix_slime, github: "slime-lang/phoenix_slime"},
     {:talon, path: "../talon", override: true},
     # {:talon, github: "talonframework/talon", override: true, branch: "server-side-tables"},
    #  {:ecto_talon, path: "../ecto_talon"},
     {:ecto_talon, github: "talonframework/ecto_talon"},
     {:cowboy, "~> 1.0"}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
