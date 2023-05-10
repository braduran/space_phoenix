defmodule SpacePhoenixWeb.Router do

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

    #Operaciones definidas por mi
    get "/astronautas/lanzamientos/:launch", AstronautaController, :query_greater_equal_launch
  end
end
