class WebLoginEvent < Hash
  include CouchRest::CastedModel

  property :ip
  property :timestamp

  def initialize properties
    super(properties)
    self[:timestamp] ||= Time.now
  end
end