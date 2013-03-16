class Sport
  include Mongoid::Document
  field :winning_points, type: Integer
  field :draw_points, type: Integer
  field :losing_points, type: Integer
  field :name, type: String

  validates :winning_points, :presence => true, :numericality => { :only_integer => true }
  validates :losing_points, :presence => true, :numericality => { :only_integer => true }
  validates :draw_points, :allow_nil => true, :numericality => { :only_integer => true }
  
end
