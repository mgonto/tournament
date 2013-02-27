class Tourney
  include Mongoid::Document
  include SimpleEnum::Mongoid

  field :name, type: String
  field :inscriptionCost, type: BigDecimal
  field :matchCost, type: BigDecimal
  field :extraInformation, type: String
  as_enum :privacy, :public => 1, :private => 0

  embeds_many :stadiums

  # Validations

  validates :extraInformation, length: {minimum: 0, maximum: 1000}, allow_nil: true
  validates :name, presence: true, length: {minimum: 5, maximum: 120}
  validates :inscriptionCost, presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 10000}
  validates :matchCost, presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 10000}
  validates :privacy, presence: true
end
