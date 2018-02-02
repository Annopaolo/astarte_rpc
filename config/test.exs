use Mix.Config

config :astarte_rpc, :amqp_connection,
  host: System.get_env("RABBITMQ_HOST") || "rabbitmq"

config :astarte_rpc, :amqp_queue,
  "test_queue"
