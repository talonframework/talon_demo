defmodule NewAdmin.ExAdmin.User do
  use ExAdmin.Resource, schema: NewAdmin.User

  def index_columns do
    [:id | super()] -- [:active, :birthdate, :height]
  end
  
end