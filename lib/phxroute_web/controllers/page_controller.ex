defmodule PhxrouteWeb.PageController do
  use PhxrouteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
