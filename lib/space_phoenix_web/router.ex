defmodule SpacePhoenixWeb.Router do
  alias SpacePhoenixWeb.CoheteController
  alias SpacePhoenixWeb.AstronautaController
  use SpacePhoenixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SpacePhoenixWeb do
    pipe_through :api

    resources "/cohetes", CoheteController, except: [:edit, :new, :update]
    put "/cohetes/:id", CoheteController, :update
    resources "/astronautas", AstronautaController, except: [:edit, :new, :update]
    put "/astronautas/:id", AstronautaController, :update
  end
end
