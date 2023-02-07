Redis.current = Redis.new(
  url: ENV.fetch("REDIS_URL"),
  port: ENV.fetch("REDIS_port"),
  db: ENV.fetch("REDIS_DATABASE")
)
