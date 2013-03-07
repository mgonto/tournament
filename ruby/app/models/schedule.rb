class Schedule
  include Mongoid::Document
  field :start_date, type: Date
  field :end_date, type: Date
  field :start_time, type: Time
  field :end_time, type: Time
  field :play_dow, type: String

  validates_datetime :finish_time, :after => :start_time


end
