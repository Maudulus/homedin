require 'spec_helper'

describe SearchResultParser do

  let(:single_house_response) do
    {"searchresults"=>
      {"request"=>{"address"=>"195 Davis Ave Apt. 4", "citystatezip"=>"02445"},
       "message"=>{"text"=>"Request successfully processed", "code"=>"0"},
       "response"=>
        {"results"=>
          {"result"=>
            {"zpid"=>"56567423",
             "links"=>
              {"homedetails"=>
                "http://www.zillow.com/homedetails/195-Davis-Ave-APT-4-Brookline-MA-02445/56567423_zpid/",
               "graphsanddata"=>
                "http://www.zillow.com/homedetails/195-Davis-Ave-APT-4-Brookline-MA-02445/56567423_zpid/#charts-and-data",
               "mapthishome"=>"http://www.zillow.com/homes/56567423_zpid/",
               "comparables"=>"http://www.zillow.com/homes/comps/56567423_zpid/"},
             "address"=>
              {"street"=>"195 Davis Ave APT 4",
               "zipcode"=>"02445",
               "city"=>"Brookline",
               "state"=>"MA",
               "latitude"=>"42.332511",
               "longitude"=>"-71.126619"},
             "FIPScounty"=>"25021",
             "useCode"=>"Condominium",
             "taxAssessmentYear"=>"2013",
             "taxAssessment"=>"453300.0",
             "yearBuilt"=>"1875",
             "lotSizeSqFt"=>"99999",
             "finishedSqFt"=>"1340",
             "bathrooms"=>"1.0",
             "bedrooms"=>"3",
             "totalRooms"=>"5",
             "lastSoldDate"=>"08/31/2005",
             "lastSoldPrice"=>{"__content__"=>"405500", "currency"=>"USD"},
             "zestimate"=>
              {"amount"=>{"__content__"=>"537755", "currency"=>"USD"},
               "last_updated"=>"04/22/2014",
               "oneWeekChange"=>{"deprecated"=>"true"},
               "valueChange"=>
                {"__content__"=>"-4237", "duration"=>"30", "currency"=>"USD"},
               "valuationRange"=>
                {"low"=>{"__content__"=>"494735", "currency"=>"USD"},
                 "high"=>{"__content__"=>"575398", "currency"=>"USD"}},
               "percentile"=>"0"},
             "localRealEstate"=>
              {"region"=>
                {"links"=>
                  {"overview"=>
                    "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                   "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                   "forSale"=>"http://www.zillow.com/brookline-ma/"},
                 "id"=>"17188",
                 "type"=>"city",
                 "name"=>"Brookline"}}}}},
       "schemaLocation"=>
        "http://www.zillow.com/static/xsd/SearchResults.xsd http://www.zillowstatic.com/vstatic/LATEST/static/xsd/SearchResults.xsd"}}
  end


  let(:multi_house_response) do
    {"searchresults"=>
  {"request"=>{"address"=>"1470 Beacon Street", "citystatezip"=>"02446"},
   "message"=>{"text"=>"Request successfully processed", "code"=>"0"},
   "response"=>
    {"results"=>
      {"result"=>
        [{"zpid"=>"2112937507",
          "links"=>
           {"homedetails"=>
             "http://www.zillow.com/homedetails/1470-Beacon-St-APT-1-Brookline-MA-02446/2112937507_zpid/",
            "mapthishome"=>"http://www.zillow.com/homes/2112937507_zpid/",
            "comparables"=>
             "http://www.zillow.com/homes/comps/2112937507_zpid/"},
          "address"=>
           {"street"=>"1470 Beacon St APT 1",
            "zipcode"=>"02446",
            "city"=>"Brookline",
            "state"=>"MA",
            "latitude"=>"42.340334",
            "longitude"=>"-71.128471"},
          "FIPScounty"=>nil,
          "useCode"=>"Unknown",
          "zestimate"=>
           {"amount"=>{"__content__"=>"576540", "currency"=>"USD"},
            "last_updated"=>"04/22/2014",
            "oneWeekChange"=>{"deprecated"=>"true"},
            "valueChange"=>
             {"__content__"=>"-15108", "duration"=>"30", "currency"=>"USD"},
            "valuationRange"=>
             {"low"=>{"__content__"=>"530417", "currency"=>"USD"},
              "high"=>{"__content__"=>"622663", "currency"=>"USD"}},
            "percentile"=>"0"},
          "localRealEstate"=>
           {"region"=>
             {"links"=>
               {"overview"=>
                 "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                "forSale"=>"http://www.zillow.com/brookline-ma/"},
              "id"=>"17188",
              "type"=>"city",
              "name"=>"Brookline"}}},
         {"zpid"=>"2117446289",
          "links"=>
           {"homedetails"=>
             "http://www.zillow.com/homedetails/1470-Beacon-St-APT-A-Brookline-MA-02446/2117446289_zpid/",
            "mapthishome"=>"http://www.zillow.com/homes/2117446289_zpid/",
            "comparables"=>
             "http://www.zillow.com/homes/comps/2117446289_zpid/"},
          "address"=>
           {"street"=>"1470 Beacon St APT A",
            "zipcode"=>"02446",
            "city"=>"Brookline",
            "state"=>"MA",
            "latitude"=>"42.340334",
            "longitude"=>"-71.128471"},
          "FIPScounty"=>nil,
          "useCode"=>"Unknown",
          "zestimate"=>
           {"amount"=>{"currency"=>"USD"},
            "last_updated"=>"12/31/1969",
            "oneWeekChange"=>{"deprecated"=>"true"},
            "valueChange"=>nil,
            "valuationRange"=>
             {"low"=>{"currency"=>"USD"}, "high"=>{"currency"=>"USD"}},
            "percentile"=>"0"},
          "localRealEstate"=>
           {"region"=>
             {"links"=>
               {"overview"=>
                 "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                "forSale"=>"http://www.zillow.com/brookline-ma/"},
              "id"=>"17188",
              "type"=>"city",
              "name"=>"Brookline"}}},
         {"zpid"=>"2117752993",
          "links"=>
           {"homedetails"=>
             "http://www.zillow.com/homedetails/1470-Beacon-St-APT-57-Brookline-MA-02446/2117752993_zpid/",
            "mapthishome"=>"http://www.zillow.com/homes/2117752993_zpid/",
            "comparables"=>
             "http://www.zillow.com/homes/comps/2117752993_zpid/"},
          "address"=>
           {"street"=>"1470 Beacon St APT 57",
            "zipcode"=>"02446",
            "city"=>"Brookline",
            "state"=>"MA",
            "latitude"=>"42.340334",
            "longitude"=>"-71.128471"},
          "FIPScounty"=>nil,
          "useCode"=>"Apartment",
          "bathrooms"=>"1.0",
          "bedrooms"=>"0",
          "zestimate"=>
           {"amount"=>{"currency"=>"USD"},
            "last_updated"=>"12/31/1969",
            "oneWeekChange"=>{"deprecated"=>"true"},
            "valueChange"=>nil,
            "valuationRange"=>
             {"low"=>{"currency"=>"USD"}, "high"=>{"currency"=>"USD"}},
            "percentile"=>"0"},
          "localRealEstate"=>
           {"region"=>
             {"links"=>
               {"overview"=>
                 "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                "forSale"=>"http://www.zillow.com/brookline-ma/"},
              "id"=>"17188",
              "type"=>"city",
              "name"=>"Brookline"}}},
         {"zpid"=>"2118002750",
          "links"=>
           {"homedetails"=>
             "http://www.zillow.com/homedetails/1470-Beacon-St-APT-33-Brookline-MA-02446/2118002750_zpid/",
            "mapthishome"=>"http://www.zillow.com/homes/2118002750_zpid/",
            "comparables"=>
             "http://www.zillow.com/homes/comps/2118002750_zpid/"},
          "address"=>
           {"street"=>"1470 Beacon St APT 33",
            "zipcode"=>"02446",
            "city"=>"Brookline",
            "state"=>"MA",
            "latitude"=>"42.340334",
            "longitude"=>"-71.128471"},
          "FIPScounty"=>nil,
          "useCode"=>"Apartment",
          "bathrooms"=>"1.0",
          "bedrooms"=>"0",
          "zestimate"=>
           {"amount"=>{"currency"=>"USD"},
            "last_updated"=>"12/31/1969",
            "oneWeekChange"=>{"deprecated"=>"true"},
            "valueChange"=>nil,
            "valuationRange"=>
             {"low"=>{"currency"=>"USD"}, "high"=>{"currency"=>"USD"}},
            "percentile"=>"0"},
          "localRealEstate"=>
           {"region"=>
             {"links"=>
               {"overview"=>
                 "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                "forSale"=>"http://www.zillow.com/brookline-ma/"},
              "id"=>"17188",
              "type"=>"city",
              "name"=>"Brookline"}}},
         {"zpid"=>"2118002751",
          "links"=>
           {"homedetails"=>
             "http://www.zillow.com/homedetails/1470-Beacon-St-APT-46-Brookline-MA-02446/2118002751_zpid/",
            "mapthishome"=>"http://www.zillow.com/homes/2118002751_zpid/",
            "comparables"=>
             "http://www.zillow.com/homes/comps/2118002751_zpid/"},
          "address"=>
           {"street"=>"1470 Beacon St APT 46",
            "zipcode"=>"02446",
            "city"=>"Brookline",
            "state"=>"MA",
            "latitude"=>"42.340334",
            "longitude"=>"-71.128471"},
          "FIPScounty"=>nil,
          "useCode"=>"Apartment",
          "bathrooms"=>"1.0",
          "bedrooms"=>"0",
          "zestimate"=>
           {"amount"=>{"currency"=>"USD"},
            "last_updated"=>"12/31/1969",
            "oneWeekChange"=>{"deprecated"=>"true"},
            "valueChange"=>nil,
            "valuationRange"=>
             {"low"=>{"currency"=>"USD"}, "high"=>{"currency"=>"USD"}},
            "percentile"=>"0"},
          "localRealEstate"=>
           {"region"=>
             {"links"=>
               {"overview"=>
                 "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                "forSale"=>"http://www.zillow.com/brookline-ma/"},
              "id"=>"17188",
              "type"=>"city",
              "name"=>"Brookline"}}},
         {"zpid"=>"2118305401",
          "links"=>
           {"homedetails"=>
             "http://www.zillow.com/homedetails/1470-Beacon-St-APT-48-Brookline-MA-02446/2118305401_zpid/",
            "mapthishome"=>"http://www.zillow.com/homes/2118305401_zpid/",
            "comparables"=>
             "http://www.zillow.com/homes/comps/2118305401_zpid/"},
          "address"=>
           {"street"=>"1470 Beacon St APT 48",
            "zipcode"=>"02446",
            "city"=>"Brookline",
            "state"=>"MA",
            "latitude"=>"42.340334",
            "longitude"=>"-71.128471"},
          "FIPScounty"=>nil,
          "useCode"=>"Apartment",
          "bathrooms"=>"1.0",
          "bedrooms"=>"0",
          "zestimate"=>
           {"amount"=>{"currency"=>"USD"},
            "last_updated"=>"12/31/1969",
            "oneWeekChange"=>{"deprecated"=>"true"},
            "valueChange"=>nil,
            "valuationRange"=>
             {"low"=>{"currency"=>"USD"}, "high"=>{"currency"=>"USD"}},
            "percentile"=>"0"},
          "localRealEstate"=>
           {"region"=>
             {"links"=>
               {"overview"=>
                 "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                "forSale"=>"http://www.zillow.com/brookline-ma/"},
              "id"=>"17188",
              "type"=>"city",
              "name"=>"Brookline"}}},
         {"zpid"=>"2118723291",
          "links"=>
           {"homedetails"=>
             "http://www.zillow.com/homedetails/1470-Beacon-St-APT-4-Brookline-MA-02446/2118723291_zpid/",
            "mapthishome"=>"http://www.zillow.com/homes/2118723291_zpid/",
            "comparables"=>
             "http://www.zillow.com/homes/comps/2118723291_zpid/"},
          "address"=>
           {"street"=>"1470 Beacon St APT 4",
            "zipcode"=>"02446",
            "city"=>"Brookline",
            "state"=>"MA",
            "latitude"=>"42.340334",
            "longitude"=>"-71.128471"},
          "FIPScounty"=>nil,
          "useCode"=>"Apartment",
          "finishedSqFt"=>"350",
          "bathrooms"=>"1.0",
          "bedrooms"=>"0",
          "zestimate"=>
           {"amount"=>{"currency"=>"USD"},
            "last_updated"=>"12/31/1969",
            "oneWeekChange"=>{"deprecated"=>"true"},
            "valueChange"=>nil,
            "valuationRange"=>
             {"low"=>{"currency"=>"USD"}, "high"=>{"currency"=>"USD"}},
            "percentile"=>"0"},
          "localRealEstate"=>
           {"region"=>
             {"links"=>
               {"overview"=>
                 "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                "forSale"=>"http://www.zillow.com/brookline-ma/"},
              "id"=>"17188",
              "type"=>"city",
              "name"=>"Brookline"}}},
         {"zpid"=>"2123242944",
          "links"=>
           {"homedetails"=>
             "http://www.zillow.com/homedetails/1470-Beacon-St-APT-64-Brookline-MA-02446/2123242944_zpid/",
            "mapthishome"=>"http://www.zillow.com/homes/2123242944_zpid/",
            "comparables"=>
             "http://www.zillow.com/homes/comps/2123242944_zpid/"},
          "address"=>
           {"street"=>"1470 Beacon St APT 64",
            "zipcode"=>"02446",
            "city"=>"Brookline",
            "state"=>"MA",
            "latitude"=>"42.340334",
            "longitude"=>"-71.128471"},
          "FIPScounty"=>nil,
          "useCode"=>"MultiFamily2To4",
          "finishedSqFt"=>"650",
          "bathrooms"=>"1.0",
          "bedrooms"=>"1",
          "zestimate"=>
           {"amount"=>{"__content__"=>"481201", "currency"=>"USD"},
            "last_updated"=>"04/22/2014",
            "oneWeekChange"=>{"deprecated"=>"true"},
            "valueChange"=>
             {"__content__"=>"-12269", "duration"=>"30", "currency"=>"USD"},
            "valuationRange"=>
             {"low"=>{"__content__"=>"423457", "currency"=>"USD"},
              "high"=>{"__content__"=>"519697", "currency"=>"USD"}},
            "percentile"=>"0"},
          "localRealEstate"=>
           {"region"=>
             {"links"=>
               {"overview"=>
                 "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                "forSale"=>"http://www.zillow.com/brookline-ma/"},
              "id"=>"17188",
              "type"=>"city",
              "name"=>"Brookline"}}},
         {"zpid"=>"2125196794",
          "links"=>
           {"homedetails"=>
             "http://www.zillow.com/homedetails/1470-Beacon-St-APT-29-Brookline-MA-02446/2125196794_zpid/",
            "mapthishome"=>"http://www.zillow.com/homes/2125196794_zpid/",
            "comparables"=>
             "http://www.zillow.com/homes/comps/2125196794_zpid/"},
          "address"=>
           {"street"=>"1470 Beacon St APT 29",
            "zipcode"=>"02446",
            "city"=>"Brookline",
            "state"=>"MA",
            "latitude"=>"42.34044",
            "longitude"=>"-71.12829"},
          "FIPScounty"=>nil,
          "useCode"=>"Unknown",
          "bathrooms"=>"1.0",
          "zestimate"=>
           {"amount"=>{"currency"=>"USD"},
            "last_updated"=>"12/31/1969",
            "oneWeekChange"=>{"deprecated"=>"true"},
            "valueChange"=>nil,
            "valuationRange"=>
             {"low"=>{"currency"=>"USD"}, "high"=>{"currency"=>"USD"}},
            "percentile"=>"0"},
          "localRealEstate"=>
           {"region"=>
             {"links"=>
               {"overview"=>
                 "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                "forSale"=>"http://www.zillow.com/brookline-ma/"},
              "id"=>"17188",
              "type"=>"city",
              "name"=>"Brookline"}}},
         {"zpid"=>"2125736087",
          "links"=>
           {"homedetails"=>
             "http://www.zillow.com/homedetails/1470-Beacon-St-APT-59-Brookline-MA-02446/2125736087_zpid/",
            "mapthishome"=>"http://www.zillow.com/homes/2125736087_zpid/",
            "comparables"=>
             "http://www.zillow.com/homes/comps/2125736087_zpid/"},
          "address"=>
           {"street"=>"1470 Beacon St APT 59",
            "zipcode"=>"02446",
            "city"=>"Brookline",
            "state"=>"MA",
            "latitude"=>"42.34044",
            "longitude"=>"-71.12829"},
          "FIPScounty"=>nil,
          "useCode"=>"Unknown",
          "finishedSqFt"=>"320",
          "bathrooms"=>"1.0",
          "zestimate"=>
           {"amount"=>{"currency"=>"USD"},
            "last_updated"=>"12/31/1969",
            "oneWeekChange"=>{"deprecated"=>"true"},
            "valueChange"=>nil,
            "valuationRange"=>
             {"low"=>{"currency"=>"USD"}, "high"=>{"currency"=>"USD"}},
            "percentile"=>"0"},
          "localRealEstate"=>
           {"region"=>
             {"links"=>
               {"overview"=>
                 "http://www.zillow.com/local-info/MA-Brookline/r_17188/",
                "forSaleByOwner"=>"http://www.zillow.com/brookline-ma/fsbo/",
                "forSale"=>"http://www.zillow.com/brookline-ma/"},
              "id"=>"17188",
              "type"=>"city",
              "name"=>"Brookline"}}}]}},
   "schemaLocation"=>
    "http://www.zillow.com/static/xsd/SearchResults.xsd http://www.zillowstatic.com/vstatic/LATEST/static/xsd/SearchResults.xsd"}}
  end

  describe "#results" do
    it "finds the correct number of results for a multi-unit house" do
      parser = SearchResultParser.new(multi_house_response)

      expect(parser.multi_house_results.count).to be >0
    end
  end

  describe "#results" do
    it "finds the correct number of results for a single house" do
      parser = SearchResultParser.new(single_house_response)

      expect(parser.single_house_results).to be_nil
    end
  end
end
