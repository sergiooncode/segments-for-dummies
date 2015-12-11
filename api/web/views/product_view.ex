defmodule Api.ProductView do
  use Api.Web, :view

  def render("index.json", %{products: products}) do
    %{data: render_many(products, Api.ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, Api.ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{id: product.id,
      name: product.name,
      forbidden_mood: product.forbidden_mood,
      featured_mood: product.featured_mood,
      priority: product.priority}
  end
end
