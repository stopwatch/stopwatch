class Timer < ActiveRecord::Base
  URL_KEY_RING = [ *0..9, *'a'..'z', *'A'..'Z' ].join

  before_validation :generate_url_key
  before_validation :generate_admin_key

  private

  def generate_url_key
    return unless url_key.nil?

    value = $redis.incr('timer:url_keys')
    result = ''

    until value == 0
      result << URL_KEY_RING[ value % URL_KEY_RING.length ]
      value /= URL_KEY_RING.length
    end

    self.url_key = result
  end

  def generate_admin_key
    self.admin_key = SecureRandom.hex(10)
  end
end
