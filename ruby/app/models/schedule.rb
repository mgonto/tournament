class Schedule
  include Mongoid::Document
  field :start_date, type: Date
  field :end_date, type: Date
  field :start_time, type: Integer
  field :end_time, type: Integer
  field :play_dow, type: String

  validates_date :end_date, :after => :start_date
  validates_date :start_date, :on_or_after => lambda { Date.today }

  def time_to_int(time)
    return -1 unless time =~ /\d\d:\d\d/

    hh, mm = time.split ':'
    time = hh.to_i * 60
    time = time + mm.to_i

    time
  end  

end
