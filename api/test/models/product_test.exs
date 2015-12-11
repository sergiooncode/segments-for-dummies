defmodule Api.ProductTest do
  use Api.ModelCase

  alias Api.Product

  @valid_attrs %{featured_mood: "some content", forbidden_mood: "some content", name: "some content", priority: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
