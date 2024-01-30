defmodule MiaWeb.Router do
  use MiaWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "swiftui"]
    plug :fetch_session
    plug :fetch_live_flash

    plug :put_root_layout,
      html: {MiaWeb.Layouts, :root},
      swiftui: {MiaWeb.LayoutsSwiftUI, :root}

    plug :protect_from_forgery
    plug :put_secure_browser_headers, %{"content-security-policy" => "default-src 'self'"}
  end

  scope "/", MiaWeb do
    pipe_through :browser

    live_session :root do
      live "/", HomeLive
    end
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:mia, :dev_routes) do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
