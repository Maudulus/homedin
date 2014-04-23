class Zillow
  include HTTParty
  BASE_URI = 'http://www.zillow.com/webservice/GetDeepSearchResults.htm?zws-id='
  DESCRIPTION_URI = 'http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id='

  attr_reader :price, :street_address, :zip, :city, :state, :bedrooms, :bathrooms, :url, :zpid, :address, :citystatezip, :description, :image_url

  def initialize(address, citystatezip)
    @address = address
    @citystatezip = citystatezip

    @response = search_results

    @price = (@response["searchresults"]["response"]["results"]["result"]["zestimate"]["amount"]["__content__"]).to_i
    @street_address = @response["searchresults"]["response"]["results"]["result"]["address"]["street"]
    @zip = @response["searchresults"]["response"]["results"]["result"]["address"]["zipcode"]
    @city = @response["searchresults"]["response"]["results"]["result"]["address"]["city"]
    @state = @response["searchresults"]["response"]["results"]["result"]["address"]["state"]
    @bedrooms = @response["searchresults"]["response"]["results"]["result"]["bedrooms"]
    @bathrooms = @response["searchresults"]["response"]["results"]["result"]["bathrooms"]
    @url = @response["searchresults"]["response"]["results"]["result"]["links"]["homedetails"]
    @zpid = @response["searchresults"]["response"]["results"]["result"]["zpid"]

    @description_image_response = description_image
    if !@description_image_response["updatedPropertyDetails"]["message"]["text"].include?("Error") && ((@description_image_response["updatedPropertyDetails"]["response"]["images"] != nil) && ( @description_image_response["updatedPropertyDetails"]["response"]["homeDescription"] != nil) )
      @description = @description_image_response["updatedPropertyDetails"]["response"]["homeDescription"]
      @image_url = @description_image_response["updatedPropertyDetails"]["response"]["images"]["image"]["url"][0]
    else
      @description = "Description not currently available"
      @image_url = "http://upload.wikimedia.org/wikipedia/commons/2/22/Belton_House_2006_Giano.jpg"
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

end


