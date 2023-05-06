defmodule SpacePhoenixWeb.Router do
  use SpacePhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SpacePhoenixWeb do
    pipe_through :api
  end
end
