defmodule Api.ShopperController do
  require Logger

  use Api.Web, :controller

  alias Api.Shopper

  plug :scrub_params, "shopper" when action in [:create, :update]

  def index(conn, _params) do
    shoppers = Repo.all(Shopper)
    render(conn, "index.json", shoppers: shoppers)
  end

  def create(conn, %{"shopper" => shopper_params}) do
    changeset = Shopper.changeset(%Shopper{}, shopper_params)

    case Repo.insert(changeset) do
      {:ok, shopper} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", shopper_path(conn, :show, shopper))
        |> render("show.json", shopper: shopper)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Api.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    shopper = Repo.get!(Shopper, id)
    render(conn, "show.json", shopper: shopper)
  end

  def showuser(conn, %{"username" => username}) do
    shopper = Repo.get_by!(Shopper, username: username)
    render(conn, "show.json", shopper: shopper)
  end

  def update(conn, %{"id" => id, "shopper" => shopper_params}) do
    shopper = Repo.get!(Shopper, id)
    changeset = Shopper.changeset(shopper, shopper_params)

    case Repo.update(changeset) do
      {:ok, shopper} ->
        render(conn, "show.json", shopper: shopper)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Api.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    shopper = Repo.get!(Shopper, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(shopper)

    send_resp(conn, :no_content, "")
  end
end
