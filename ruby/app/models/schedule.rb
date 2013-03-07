class Schedule
  include Mongoid::Document
  field :start_date, type: Date
  field :end_date, type: Date
  field :start_time, type: Integer
  field :end_time, type: Integer
  field :play_dow, type: String

  validates_date :end_date, :after => :start_date
  validates_date :start_date, :on_or_after => lambda { Date.today }



end
