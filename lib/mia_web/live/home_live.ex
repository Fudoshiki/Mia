defmodule MiaWeb.HomeLive do
  @moduledoc false
  use MiaWeb, :live_view

  use LiveViewNative.LiveView,
    formats: [:html, :swiftui],
    layouts: [
      html: {MiaWeb.Layouts, :app},
      swiftui: {MiaWeb.LayoutsSwiftUI, :app}
    ]
end
