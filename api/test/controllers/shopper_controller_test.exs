defmodule Api.ShopperControllerTest do
  use Api.ConnCase

  alias Api.Shopper
  @valid_attrs %{mood: "some content", name: "some content", username: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, shopper_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    shopper = Repo.insert! %Shopper{}
    conn = get conn, shopper_path(conn, :show, shopper)
    assert json_response(conn, 200)["data"] == %{"id" => shopper.id,
      "name" => shopper.name,
      "mood" => shopper.mood,
      "username" => shopper.username}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, shopper_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, shopper_path(conn, :create), shopper: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Shopper, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, shopper_path(conn, :create), shopper: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    shopper = Repo.insert! %Shopper{}
    conn = put conn, shopper_path(conn, :update, shopper), shopper: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Shopper, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    shopper = Repo.insert! %Shopper{}
    conn = put conn, shopper_path(conn, :update, shopper), shopper: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    shopper = Repo.insert! %Shopper{}
    conn = delete conn, shopper_path(conn, :delete, shopper)
    assert response(conn, 204)
    refute Repo.get(Shopper, shopper.id)
  end
end
