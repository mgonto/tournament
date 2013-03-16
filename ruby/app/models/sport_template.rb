class SportTemplate < Sport
  include Mongoid::Document

  validates :winning_points, :presence => true, :numericality => { :only_integer => true }
  validates :losing_points, :presence => true, :numericality => { :only_integer => true }
  validates :draw_points, :allow_nil => true, :numericality => { :only_integer => true }

end
