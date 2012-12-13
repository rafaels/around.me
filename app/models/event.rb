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
    users << new_user
  end

  after_create :send_notifications

  private
  def send_notifications
    sender = HiGCM::Sender.new("AIzaSyCYnvhAtPwzsz1fKUChyLbfeNOZuSpnMes")
    reg_ids = (User.all - [created_by]).map {|user| user.reg_id}.compact
    opts = {
      :collapse_key => "new_event",
      :data         => { :event_id => id }
    }
    response = sender.send(reg_ids, opts)
  end
end

