class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :event_type
  field :data

  belongs_to :project

  validates_presence_of :project
end
