require 'spec_helper'

describe Tourney do
  it { should validate(:presence).of(:name) }
  it { should validate(:presence).of(:inscriptionCost) }
  it { should validate(:presence).of(:matchCost) }
  it { should validate(:presence).of(:privacy) }
  it { should validate_length_of(:extraInformation).within(0..1000) }
  it { should validate_length_of(:name).within(5..120) }
  it { should validate_numericality_of(:inscriptionCost).greater_than_or_equal_to(0).less_than(10000) }
  it { should validate_numericality_of(:matchCost).greater_than_or_equal_to(0).less_than(10000) }


end
