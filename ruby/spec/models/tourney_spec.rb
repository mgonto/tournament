require 'spec_helper'

describe Tourney do
  it { should validate(:presence).of(:name) }
  it { should validate(:presence).of(:inscription_cost) }
  it { should validate(:presence).of(:match_cost) }
  it { should validate(:presence).of(:privacy) }
  it { should validate_length_of(:extra_information).within(0..1000) }
  it { should validate_length_of(:name).within(5..120) }
  it { should validate_numericality_of(:inscription_cost).greater_than_or_equal_to(0).less_than(10000) }
  it { should validate_numericality_of(:match_cost).greater_than_or_equal_to(0).less_than(10000) }

  it { should validate(:associated).of(:stadiums) }
  it { should validate(:associated).of(:schedule) }
  it { should validate(:associated).of(:sport) }
  it { should validate(:associated).of(:tournament_status) }


end
