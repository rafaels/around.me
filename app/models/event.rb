class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :created_by, :class_name => "User", :inverse_of => "created_events"
  has_and_belongs_to_many :users

  field :name, type: String
  field :description, type: String
  field :date, type: String
  field :x, type: String
  field :y, type: String

  validates_presence_of :name, :description, :date, :x, :y, :created_by_id

  def participate!(new_user)
    users << new_users
  end
end

