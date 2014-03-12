class Project
  include Mongoid::Document

  field :name
  field :key
  field :url

  has_many :events
end
