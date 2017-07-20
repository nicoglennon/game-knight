require 'net/http'
require 'json'
require 'nokogiri'

uri = URI("https://boardgamegeek.com/xmlapi2/thing?id=169786")

xml_string = Net::HTTP.get(uri)

game_info = Nokogiri::XML(xml_string)

# p game_info.css("items link").attr('value').value

p game_info.css("items link").attr('value').value
