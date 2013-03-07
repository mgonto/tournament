require 'spec_helper'

describe Schedule do
  
  it "should save valid schedule" do
    schedule = Fabricate.build(:schedule)
    schedule.valid? should be_true
  end


  it "should fail with start date in the past " do
    schedule = Fabricate.build(:schedule, :start_date => 10.days.ago)
    schedule.valid?.should be_false
    schedule.errors.should include(:start_date)
  end

  it "should fail with end date before start " do
    schedule = Fabricate.build(:schedule, :start_date => 10.days.from_now, :end_date => 9.days.from_now)
    schedule.valid?.should be_false
    schedule.errors.should include(:end_date)
    schedule.errors.should_not include(:start_date)
  end

end
