class API::V1::TimerResource < JSONAPI::Resource
  primary_key :url_key

  attributes :time

  def self.verify_key(key, context = nil)
    key && String(key)
  end
end
