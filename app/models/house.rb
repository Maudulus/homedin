class House < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :emails
  has_many :ratings

end
