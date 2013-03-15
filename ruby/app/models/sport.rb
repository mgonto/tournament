class Sport
  include Mongoid::Document
  field :winning_points, type: Integer
  field :draw_points, type: Integer
  field :losing_points, type: Integer
  field :name, type: String
end
