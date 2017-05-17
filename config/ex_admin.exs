use Mix.Config

config :ex_admin, resources: [
  NewAdmin.ExAdmin.Country,
  NewAdmin.ExAdmin.State,
  NewAdmin.ExAdmin.User,
], 
module: NewAdmin,
messages_backend: NewAdmin.Gettext,
theme: "admin_lte",
schema_adapter: ExAdmin.Schema.Adapters.Ecto

