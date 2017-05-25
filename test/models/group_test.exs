defmodule TalonDemo.GroupTest do
  use TalonDemo.ModelCase

  alias TalonDemo.Group

  @valid_attrs %{description: "some description", name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Group.changeset(%Group{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Group.changeset(%Group{}, @invalid_attrs)
    refute changeset.valid?
  end
end
