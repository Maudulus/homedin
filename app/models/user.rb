class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :houses
  has_many :ratings
  has_many :textmessages
  has_many :votes

  validates :username, presence: true

  def twilio_client
    Twilio::REST::Client.new self.account_sid,
                             self.auth_token
  end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     binding.pry
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end

  # def self.new_with_session(params, session)
  #   if session["devise.user_attributes"]
  #     new(session["devise.user_attributes"], without_protection: true) do |user|
  #       user.attributes = params
  #       user.valid?
  #     end
  #   else
  #     super
  #   end
  # end

  def password_required?
    super && provider.blank?
  end
end

