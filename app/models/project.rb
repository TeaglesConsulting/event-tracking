class Project
  include Mongoid::Document

  field :name
  field :key
  field :url
  
  belongs_to :event
end
