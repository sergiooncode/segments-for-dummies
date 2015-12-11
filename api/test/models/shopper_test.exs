defmodule Api.ShopperTest do
  use Api.ModelCase

  alias Api.Shopper

  @valid_attrs %{mood: "some content", name: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Shopper.changeset(%Shopper{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Shopper.changeset(%Shopper{}, @invalid_attrs)
    refute changeset.valid?
  end
end
