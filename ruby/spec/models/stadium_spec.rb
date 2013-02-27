require 'spec_helper'

describe Stadium do

  it { should validate(:presence).of(:name) }
  it { should validate(:presence).of(:place) }
  it { should validate(:presence).of(:address) }
  it { should validate(:presence).of(:phone) }

  it { should validate_length_of(:name).within(5..120) }
  it { should validate_length_of(:place).within(5..120) }
  it { should validate_length_of(:address).within(5..120) }
  it { should validate_length_of(:phone).within(8..20) }

  it "should check for a valid phone fail" do
    stadium = Fabricate.build(:stadium, phone: "45a")
    stadium.valid?.should be_false
    stadium.errors.should include(:phone)
  end

  it "should check for a valid phone ok" do
    stadium = Fabricate.build(:stadium, phone: "4855-7524")
    stadium.valid?.should be_true
  end

end
