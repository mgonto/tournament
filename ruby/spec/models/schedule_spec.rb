require 'spec_helper'

describe Schedule do

  it { should validate_numericality_of(:start_time).greater_than_or_equal_to(0).less_than(1440) }
  it { should validate_numericality_of(:end_time).greater_than_or_equal_to(0).less_than(1440) }
  
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

  describe "test time_to_int" do

    cases = Hash.new
    cases["00:00"] = 0
    cases["01:00"] = 60
    cases["01:01"] = 61
    cases["as:as"] = -1
    cases["1:1"]   = -1

    cases.each do |hour, minutes_from_midnight|
      
      it("should convert the time #{hour} to #{minutes_from_midnight}") do 
        schedule = Fabricate.build(:schedule)
        schedule.time_to_int(hour).should eq minutes_from_midnight
      end

    end

  end    

end
