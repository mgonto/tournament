class User
  include Mongoid::Document
  include Mongoid::Timestamps

  before_save :ensure_authentication_token

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :token_authenticatable

  ## Database authenticatable
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  field :authentication_token, :type => String

  
  
  field :email, type: String
  field :password, type: String
  field :facebook_id, type: String
  field :facebook_token, type: String
  
  attr_accessible :email, :password

  validates :password, presence: true, length: { minimum: 6, maximum: 128 }, on: :create
  validates :email, presence: true, uniqueness: true, email_format: true
  validates :facebook_id, uniqueness: true, allow_nil: true

 class << self
    def from_facebook_user(facebook_user, token)
      user = User.new
      user.facebook_id = facebook_user["id"]
      user.facebook_token = token
      user.email = facebook_user["email"]
      user.password = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join
      user
    end
  end 

  
  
end