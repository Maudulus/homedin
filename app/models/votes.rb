class Votes < ActiveRecord::Base
  belongs_to :house
  belongs_to :user
end
