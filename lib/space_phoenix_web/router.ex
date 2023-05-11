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

    #Obtener astronautas con lanzamientos mayor o igual a
    get "/astronautas/lanzamientos/:launch", AstronautaController, :query_greater_equal_launch
    post "/cohetes/astronautas", CoheteController, :create_all
    get "/cohetes/marca/:cohete_brand", CoheteController, :quey_like_brand
  end
end
