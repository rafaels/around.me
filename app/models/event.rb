class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :created_by, :class_name => "User"

  field :name, type: String
  field :description, type: String
  field :date, type: Date
  field :x, type: String
  field :y, type: String

  validates_presence_of :name, :description, :date, :x, :y, :created_by_id
end

