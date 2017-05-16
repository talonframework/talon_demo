defmodule NewAdmin.CountryTest do
  use NewAdmin.ModelCase

  alias NewAdmin.Country

  @valid_attrs %{abbr: "some abbr", code: 42, name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Country.changeset(%Country{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Country.changeset(%Country{}, @invalid_attrs)
    refute changeset.valid?
  end
end
