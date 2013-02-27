require 'spec_helper'

describe User do

  it { should validate(:presence).of(:password) }
  it { should validate(:presence).of(:email) }
  it { should validate(:uniqueness).of(:email) }
  it { should validate(:uniqueness).of(:facebook_id) }
  it { should validate_length_of(:password).within(6..128) }
  

  it "should check for a valid email" do
    u = Fabricate.build(:normal_user, email: "pepe@pepe")
    u.valid?.should be_false
    u.errors.should include(:email)
  end

  context "when trying to persist it" do

    it "should fail if invalid" do
      expect { Fabricate(:normal_user, email: "pepe@pepe") }.to raise_error
    end

    it "should success if valid" do
      Fabricate(:normal_user).should be_persisted
    end
  end
end

