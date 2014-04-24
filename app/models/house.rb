class House < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :emails
  has_many :ratings
  has_many :textmessages
  has_many :votes

  validates :price, numericality: true
  mount_uploader :image, ImageUploader
end
