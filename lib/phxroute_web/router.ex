defmodule PhxrouteWeb.Router do
  use PhxrouteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxrouteWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  #pipeline :vendor do
  #    plug Plug.Static,
  #         at: "/vendor",
  #         from: {:phxstatic, "priv/static/vendor"}
  #  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxrouteWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: PhxrouteWeb.Telemetry
      #scope "/vendor" do
      #        pipe_through :vendor
      #      end
    end
  end
end
