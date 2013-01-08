require "net/http"
require "uri"
require "CGI"
require "JSON"
candidates = [
  { 
    name: "Timothy Peter Briggs",
    party: "Conservative Party",
    postcode: "SW4 9RJ"
  },
  { 
    name: "Andrew James Child",
    party: "Green Party",
    postcode: "SW2 4DS"
  },
  { 
    name: " Elizabeth Eirwen Jones",
    party: "UK Independence Party (UKIP)",
    postcode: "SW4 7HE"
  },
  { 
    name: "Daniel Peter Lambert",
    party: "The Socialist Party (GB)",
    postcode: "BR7 5DS"
  },
  { 
    name: "Liz Maffei",
    party: "Liberal Democrats",
    postcode: "SW4 7NN"
  },
  { 
    name: "Steve Nally",
    party: "Trade Unionist and Socialist Coalition",
    postcode: "SW8 1UA"
  },
  { 
    name: "Martin Andreas Tiedemann",
    party: "Labour and Co-operative Party Candidate",
    postcode: " SW2 5BA"
  }
]

geocoded_candiates = []

#  
candidates.each do |candidate|
  url_path = "http://nominatim.openstreetmap.org/search?q=#{CGI::escape(candidate[:postcode])}&format=json"
  uri = URI.parse(url_path)

  # Shortcut
  response = Net::HTTP.get_response(uri)
  location = JSON.parse(response.body)[0]
  # puts location["lat"]
  # puts location["lon"]
  geocoded_candiates << candidate.merge({lat: location["lat"], lon: location["lon"]})
end

puts geocoded_candiates.inspect
puts geocoded_candiates.to_json
