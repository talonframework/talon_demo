defmodule NewAdmin.Repo do
  use Ecto.Repo, otp_app: :new_admin
  use Scrivener, page_size: 15  # <--- add this
end
