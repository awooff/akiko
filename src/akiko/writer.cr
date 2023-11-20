require "redis"

module WriterInterface
  abstract def write(key, value) : Nil
end

@[ADI::Register]
class RedisClient
  include WriterInterface

  property redis_client : Redis

  def initialize
    @redis_client = Redis.new
  end

  # :inherit:
  def write(key, value) : Nil
    # Write the content to Redis
    redis_client.set(key, value)
  end
end

# Register our worker also as a service, and set it as public.
# Ideally everything would be a service, however in most cases
# at least one service will need to be public in order to be
# the "entrypoint" into the application.
@[ADI::Register(public: true)]
class Worker
  @writer : WriterInterface

  # DI will automatically resolve the correct `WriterInterface` based on the
  # type restriction of the argument, and optionally the argument's name (more on that later).
  def initialize(writer : WriterInterface)
    # Manually assign the ivar to make changing the writer instance easier;
    # as we would only have to update these two variables within initialize versus
    # throughout the class.
    @writer = writer
  end

  def do_work
    # Do some work
    @writer.write "did work", 1
  end
end
