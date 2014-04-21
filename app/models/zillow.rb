class Zillow
  include HTTParty
  base_uri 'http://www.zillow.com/webservice/GetSearchResults.htm'

  def initialize(service, page)
    @options = { :query => {:site => service, :page => page} }
  end

  def questions
    self.class.get("/2.2/questions", @options)
  end

  def users
    self.class.get("/2.2/users", @options)
  end
end
