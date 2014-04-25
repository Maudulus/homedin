class Rating < ActiveRecord::Base
  belongs_to :house
  belongs_to :user

  def rating_total

  end
end
