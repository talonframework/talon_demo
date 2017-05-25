defmodule NewAdmin.Admin do
  @moduledoc """
  Admmin Endpoint/Context.

  This module contains a number of default functions which are all
  overridable. It is also used for namespacing configuration.

  You may create multiple instances of the module if you would like to
  have different behaviour for an ExAdmin managed front end an a separate
  ExAdmin managed backend.

  If you are using ExAdmin in differnt umbrella apps, create a separate
  module (differnt name) for each app that uses ExAdmin.
  """
  use ExAdmin, otp_app: :new_admin


end
