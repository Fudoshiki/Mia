# This file is responsible for configuring LiveView Native.
# It is auto-generated when running `mix lvn.install`.
import Config

# This file is responsible for configuring LiveView Native.
# It is auto-generated when running `mix lvn.install`.
config :live_view_native,
  plugins: [
    LiveViewNative.HTML,
    LiveViewNative.SwiftUI
  ]

config :mime, :types, %{
  "text/swiftui" => ["swiftui"]
}

config :live_view_native_stylesheet,
  content: [
    "lib/**/*.*"
  ],
  output: "priv/static/assets"

config :phoenix_template, :format_encoders, swiftui: Phoenix.HTML.Engine

config :phoenix, :template_engines, neex: LiveViewNative.Engine
