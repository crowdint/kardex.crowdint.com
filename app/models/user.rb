class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, foreign_key: 'owner_id'

  before_save :create_access_token

  def self.with_access_token(access_token)
    access_token && where(access_token: access_token).first
  end

  def create_access_token
    self.access_token = Devise.friendly_token
  end

end
