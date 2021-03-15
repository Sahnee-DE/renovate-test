defmodule RenovateTestWeb.Router do
  use RenovateTestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RenovateTestWeb do
    pipe_through :api
  end
end
