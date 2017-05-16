defmodule NewAdmin.UserTest do
  use NewAdmin.ModelCase

  alias NewAdmin.User

  @valid_attrs %{active: true, birthdate: ~D[2010-04-17], city: "some city", email: "some email", height: 42, name: "some name", street: "some street", street_num: "some street_num", zip_code: "some zip_code"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
