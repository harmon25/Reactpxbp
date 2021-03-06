defmodule Reactpxbp.UserTest do
  use Reactpxbp.ModelCase

  alias Reactpxbp.User

  @valid_attrs %{email: "some content", pw_hash: "some content"}
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
