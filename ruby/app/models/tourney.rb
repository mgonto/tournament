class Tourney
  include Mongoid::Document
  include SimpleEnum::Mongoid

  field :name, type: String
  field :inscription_cost, type: BigDecimal
  field :match_cost, type: BigDecimal
  field :extra_information, type: String
  as_enum :privacy, :public => 1, :private => 0

  has_many :stadiums

  embeds_one :schedule

  embeds_one :sport

  embeds_one :tournament_status

  validates_associated :stadiums
  validates :stadiums, presence: true
  accepts_nested_attributes_for :stadiums
  attr_accessible :stadiums

  validates_associated :schedule
  validates :schedule, presence: true
  accepts_nested_attributes_for :schedule
  attr_accessible :schedule

  validates_associated :sport
  validates :sport, presence: true
  accepts_nested_attributes_for :sport
  attr_accessible :sport

  validates_associated :tournament_status
  validates :tournament_status, presence: true
  accepts_nested_attributes_for :tournament_status
  attr_accessible :tournament_status
  


  # Validations

  validates :extra_information, length: {minimum: 0, maximum: 1000}, allow_nil: true
  validates :name, presence: true, length: {minimum: 5, maximum: 120}
  validates :inscription_cost, presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 10000}
  validates :match_cost, presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 10000}
  validates :privacy, presence: true

  after_initialize :init_tournament

  private
    def init_tournament
      tournament_status = CreatedTournament.new
    end


end
