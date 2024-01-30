defmodule LayoutStyles do
  @moduledoc false
  use LiveViewNative.Stylesheet, :swiftui

  ~SHEET"""
  "color-" <> color do
    color(.<%= color %>)
  end
  """

  def class("button-" <> style, _) do
    ~RULES"""
    buttonStyle(.<%= style %>)
    """
  end
end
