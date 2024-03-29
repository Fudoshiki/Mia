import Config

config :mia, MiaWeb.Endpoint,
  force_ssl: [
    hsts: true,
    rewrite_on: [:x_forwarded_proto]
  ]

# Configures Swoosh API Client
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: Mia.Finch

# Disable Swoosh Local Memory Storage
config :swoosh, local: false

# Do not print debug messages in production
config :logger, level: :info

# Runtime production configuration, including reading
# of environment variables, is done on config/runtime.exs.
