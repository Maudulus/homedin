class Zillow
  include HTTParty
  @base_uri = 'http://www.zillow.com/webservice/GetSearchResults.htm?zws-id='

  def search_results(address,citystatezip)
      url_s = @base_uri + ENV['ZWSID'] + '&address=' + address.to_s + '&citystatezip=' + citystatezip.to_s
      #fetch_result(url_s)
      response = HTTParty.get(url_s)
      puts response.price
      puts response.town
      puts response.description
      puts response.bedrooms
      puts response.bathrooms
      puts response.url
      puts response.address
   end

end


