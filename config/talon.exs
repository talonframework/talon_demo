use Mix.Config

config :talon_demo, :talon,
  module: TalonDemo,
  themes: ["admin-lte"],
  concerns: [TalonDemo.Admin],

  web_namespace: Web


config :talon_demo, TalonDemo.Admin,
  resources: [
    TalonDemo.Admin.Accounts.User,
    TalonDemo.Admin.Accounts.State,
    TalonDemo.Admin.Accounts.Country,
  ],
  pages: [
    TalonDemo.Admin.Dashboard
  ],
  theme: "admin-lte",
  root_path: "lib/talon_demo/talon",
  path_prefix: "",
  repo: TalonDemo.Repo,
  router: TalonDemo.Web.Router,
  endpoint: TalonDemo.Web.Endpoint,
  schema_adapter: Talon.Schema.Adapters.Ecto,
  messages_backend: TalonDemo.Talon.Messages


