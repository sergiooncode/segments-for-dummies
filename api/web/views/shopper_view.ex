defmodule Api.ShopperView do
  use Api.Web, :view

  def render("index.json", %{shoppers: shoppers}) do
    %{data: render_many(shoppers, Api.ShopperView, "shopper.json")}
  end

  def render("show.json", %{shopper: shopper}) do
    %{data: render_one(shopper, Api.ShopperView, "shopper.json")}
  end

  def render("shopper.json", %{shopper: shopper}) do
    %{id: shopper.id,
      name: shopper.name,
      mood: shopper.mood,
      username: shopper.username}
  end
end
