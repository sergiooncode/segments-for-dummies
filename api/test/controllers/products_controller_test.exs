defmodule Api.ProductsControllerTest do
  use Api.ConnCase

  alias Api.Products
  @valid_attrs %{featured_mood: "some content", forbidden_mood: "some content", name: "some content", priority: 42}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, products_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    products = Repo.insert! %Products{}
    conn = get conn, products_path(conn, :show, products)
    assert json_response(conn, 200)["data"] == %{"id" => products.id,
      "name" => products.name,
      "forbidden_mood" => products.forbidden_mood,
      "featured_mood" => products.featured_mood,
      "priority" => products.priority}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, products_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, products_path(conn, :create), products: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Products, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, products_path(conn, :create), products: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    products = Repo.insert! %Products{}
    conn = put conn, products_path(conn, :update, products), products: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Products, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    products = Repo.insert! %Products{}
    conn = put conn, products_path(conn, :update, products), products: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    products = Repo.insert! %Products{}
    conn = delete conn, products_path(conn, :delete, products)
    assert response(conn, 204)
    refute Repo.get(Products, products.id)
  end
end
