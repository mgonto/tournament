class Schedule
  include Mongoid::Document
  field :start_date, type: Date
  field :end_date, type: Date
  field :start_time, type: Integer
  field :end_time, type: Integer
  field :play_dow, type: String

  attr_accessor :start_time_string, :end_time_string
  
  
  attr_accessible :start_time_string, :end_time_string,
    :start_date, :end_date, :play_dow


  before_validation() do
    self.start_time = Schedule.time_to_int(self.start_time_string)   
    self.end_time = Schedule.time_to_int(self.end_time_string)   
  end


  validates_date :end_date, :after => :start_date
  validates_date :start_date, :on_or_after => lambda { Date.today }

  validates :start_time, :numericality => { :only_integer => true, :less_than => 1440, :greater_than_or_equal_to => 0 }
  validates :end_time, :numericality => { :only_integer => true, :less_than => 1440, :greater_than_or_equal_to => 0 }


  def self.time_to_int(time)
    return -1 unless time =~ /\d\d:\d\d/
    hh, mm = time.split ':'
    time = hh.to_i * 60
    time = time + mm.to_i
    time
  end  

end
