class Event
  include Mongoid::Document

  field :event_type
  field :data
  
  has_one :project
end
