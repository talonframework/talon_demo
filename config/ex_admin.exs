use Mix.Config

config :ex_admin, resources: [
  NewAdmin.ExAdmin.Country,
  NewAdmin.ExAdmin.State,
  NewAdmin.ExAdmin.User,
], 
module: NewAdmin,
messages_backend: NewAdmin.Gettext,
theme: "material_bootstrap",
schema_adapter: ExAdmin.Schema.Adapters.Ecto

