[
  import_deps: [:phoenix],
  plugins: [Phoenix.LiveView.HTMLFormatter, Styler],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}"],
  locals_without_parens: [
    embed_stylesheet: 1,
    rule: :*,
    throttle: :*
  ]
]
