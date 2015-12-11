defmodule Api.ProductsTest do
  use Api.ModelCase

  alias Api.Products

  @valid_attrs %{featured_mood: "some content", forbidden_mood: "some content", name: "some content", priority: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Products.changeset(%Products{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Products.changeset(%Products{}, @invalid_attrs)
    refute changeset.valid?
  end
end
