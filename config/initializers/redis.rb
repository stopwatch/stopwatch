$redis_connection = Redis.new(url: ENV['REDIS_URL'])
$redis = Redis::Namespace.new(Rails.env, redis: $redis_connection)
