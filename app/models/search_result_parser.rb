class SearchResultParser
  def initialize(response)
    @response = response.with_indifferent_access
  end

  def multi_house_results
    @response["searchresults"]["response"]["results"]["result"][0]
  end

  def single_house_results
    @response["searchresults"]["response"]["results"]["result"][0]
  end

end
