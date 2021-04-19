# This is the dev config, loaded only on local on compile time so the secrets are not important.
# DO NOT USE THESE SECRET ON PRODUCTION !

use Mix.Config

# Configure your database
config :lenra, Lenra.Repo,
  username: System.get_env("POSTGRES_USER", "postgres"),
  password: System.get_env("POSTGRES_PASSWORD", "postgres"),
  database: System.get_env("POSTGRES_DB", "lenra_dev"),
  hostname: System.get_env("POSTGRES_HOST", "localhost"),
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :lenra_web, LenraWeb.Endpoint,
  http: [port: String.to_integer(System.get_env("PORT", "4000"))],
  secret_key_base: "FuEn07fjnCLaC53BiDoBagPYdsv/S65QTfxWgusKP1BA5NiaFzXGYMHLZ6JAYxt1",
  debug_errors: false,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :cors_plug,
  origin: ["http://localhost:10000"],
  methods: ["GET", "POST", "PUT"]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

config :lenra,
  faas_url: System.get_env("FAAS_URL", "http://localhost:8080"),
  faas_auth: System.get_env("FAAS_AUTH", "Basic YWRtaW46M2kwREc4NTdLWlVaODQ3R0pheW5qMXAwbQ=="),
  faas_registry: System.get_env("FAAS_REGISTRY", "registry.gitlab.com/lenra/platform/applications")

config :peerage,
  via: Peerage.Via.List,
  node_list: [:"lenra@127.0.0.1"],
  log_results: false

config :lenra, Lenra.Mailer, sandbox: true
