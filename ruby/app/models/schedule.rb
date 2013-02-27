class Schedule
  include Mongoid::Document
  field :startDate, type: Date
  field :endDate, type: Date
  field :startTime, type: Time
  field :endTime, type: Time
  field :playDow, type: String
end
