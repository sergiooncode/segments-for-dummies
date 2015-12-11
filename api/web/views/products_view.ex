defmodule Api.ProductsView do
  use Api.Web, :view

  def render("index.json", %{product: product}) do
    %{data: render_many(product, Api.ProductsView, "products.json")}
  end

  def render("show.json", %{products: products}) do
    %{data: render_one(products, Api.ProductsView, "products.json")}
  end

  def render("products.json", %{products: products}) do
    %{id: products.id,
      name: products.name,
      forbidden_mood: products.forbidden_mood,
      featured_mood: products.featured_mood,
      priority: products.priority}
  end
end
