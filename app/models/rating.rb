class Rating < ActiveRecord::Base
  belongs_to :house
  belongs_to :user

   #attr_reader :records_array, :house_id

  # def initialize(house_id)
  #   rating_total(house_id)
  #   @house_id = house_id
  # end

  # def rating_total(house_id)
  #   sql = "SELECT SUM(cost) + SUM(location) + SUM(education) + SUM(parking) + SUM(condition) + SUM(spaciousness) + SUM(bedrooms) + SUM(bathrooms) + SUM(commute) + SUM(culture) FROM ratings where house_id=#{house_id}"
  #   @records_array = ActiveRecord::Base.connection.execute(sql)
  #  end
end
