defmodule ConduitWeb.PageController do
  use ConduitWeb, :controller

  def index(conn, _params) do
    conn |> render("index.html")
  end
end
