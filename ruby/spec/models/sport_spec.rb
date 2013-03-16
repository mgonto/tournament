require 'spec_helper'

describe Sport do
  it { should validate_numericality_of(:winning_points) }
  it { should validate_numericality_of(:draw_points) }
  it { should validate_numericality_of(:losing_points) }

  it { should allow_value(nil).for(:draw_points) }
  it { should_not allow_value(nil).for(:winning_points) }
  it { should_not allow_value(nil).for(:losing_points) }
end
