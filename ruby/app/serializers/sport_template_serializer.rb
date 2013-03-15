class SportTemplateSerializer < ActiveModel::Serializer
  attributes :id, :winning_points, :draw_points, :losing_points, :name
end
