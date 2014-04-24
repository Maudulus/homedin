class Zillow
  include HTTParty
  BASE_URI = 'http://www.zillow.com/webservice/GetDeepSearchResults.htm?zws-id='
  DESCRIPTION_URI = 'http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id='

  attr_reader :price, :street_address, :zip, :city, :state, :bedrooms, :bathrooms, :url, :zpid, :address, :citystatezip, :description, :image_url, :count

  def initialize(address, citystatezip)
    @address = address
    @citystatezip = citystatezip
    @response = search_results

    set_count
    if  @count == nil
      set_price
      set_street_address
      set_zip
      set_city
      set_state
      set_bedrooms
      set_bathrooms
      set_zpid

      @description_image_response = description_image
      if !@description_image_response["updatedPropertyDetails"]["message"]["text"].include?("Error") && ((@description_image_response["updatedPropertyDetails"]["response"]["images"] != nil) && ( @description_image_response["updatedPropertyDetails"]["response"]["homeDescription"] != nil) )
        @description = @description_image_response["updatedPropertyDetails"]["response"]["homeDescription"]
        @image_url = @description_image_response["updatedPropertyDetails"]["response"]["images"]["image"]["url"][0]
      else
        @description = "Description not currently available"
        @image_url = "http://upload.wikimedia.org/wikipedia/commons/2/22/Belton_House_2006_Giano.jpg"
      end
    end


  end

  private

  def search_results
    url_s = BASE_URI + ENV['ZWSID'] + '&address=' + address.to_s + '&citystatezip=' + citystatezip.to_s
    url_s = URI::encode(url_s)
    HTTParty.get(url_s)
  end

  def description_image
    url_s = DESCRIPTION_URI + ENV['ZWSID'] + "&zpid=" + zpid
    url_s = URI::encode(url_s)
    HTTParty.get(url_s)
  end

  def set_price
    @price = @response["searchresults"]["response"]["results"]["result"]["zestimate"]["amount"]["__content__"]
  end

  def set_street_address
    @street_address = @response["searchresults"]["response"]["results"]["result"]["address"]["street"]
  end

  def set_zip
    @zip = @response["searchresults"]["response"]["results"]["result"]["address"]["zipcode"]
  end

  def set_city
    @city = @response["searchresults"]["response"]["results"]["result"]["address"]["city"]
  end

  def set_state
    @state = @response["searchresults"]["response"]["results"]["result"]["address"]["state"]
  end

  def set_bedrooms
    @bedrooms = @response["searchresults"]["response"]["results"]["result"]["bedrooms"]
  end

  def set_bathrooms
    @bathrooms = @response["searchresults"]["response"]["results"]["result"]["bathrooms"]
  end

  def set_url
    @url = @response["searchresults"]["response"]["results"]["result"]["links"]["homedetails"]
  end

  def set_zpid
    @zpid = @response["searchresults"]["response"]["results"]["result"]["zpid"]
  end

  def set_count
    @count =  @response["searchresults"]["response"]["results"]["result"][0]
  end
end


