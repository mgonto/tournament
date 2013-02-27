class Stadium
  include Mongoid::Document

  field :name, type: String
  field :place, type: String
  field :address, type: String
  field :phone, type: String

  embedded_in :tourney

  phony_normalize :phone, :default_country_code => 'AR'


  validates :name, presence: true, length: {minimum: 5, maximum: 120}
  validates :place, presence: true, length: {minimum: 5, maximum: 120}
  validates :address, presence: true, length: {minimum: 5, maximum: 120}
  validates :phone, presence: true, length: {minimum: 8, maximum: 20}, :phony_plausible => true

end
