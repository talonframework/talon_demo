defmodule TalonDemo.Repo do
  use Ecto.Repo, otp_app: :talon_demo
  use Scrivener, page_size: 15  # <--- add this
end
