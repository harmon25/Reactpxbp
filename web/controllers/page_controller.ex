defmodule Reactpxbp.PageController do
  use Reactpxbp.Web, :controller
  plug :put_layout, "app_layout.html"

  def main_app(conn, _params) do
    render conn, "app.html"
  end



end
