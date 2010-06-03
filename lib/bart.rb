require 'net/http'
require 'nokogiri'

foo = { :ssan => 'South San Francisco' }

params = {
  :cmd => 'etd',
  :orig => 'ssan',
  :key => 'MW9S-E7SL-26DU-VV8V'
}

query_string = '?' + params.map { |key, value| [key, value] * '=' } * '&'
ssan_etd = Net::HTTP::Get.new('/api/etd.aspx' + query_string )

response = Net::HTTP.start('api.bart.gov') do |http|
  http.request(ssan_etd)
end

document = Nokogiri::XML.parse(response.body)

departures = document.css('station etd')
departures.each do |etd|
  puts etd.css('destination').text

  estimates = etd.css('estimate')
  estimates.each do |estimate|
    puts estimate.css('minutes').text
  end
end
