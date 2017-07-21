require 'net/http'
require 'json'
require 'nokogiri'
require 'active_support/core_ext/hash'

uri = URI("https://boardgamegeek.com/xmlapi2/thing?id=169786")

xml_string = Net::HTTP.get(uri)

doc = Nokogiri::XML(xml_string)

response_hash = Hash.from_xml(doc.to_s)

links_array = response_hash["items"]["item"]["link"]

categories = []
links_array.each do |link|
  categories << link["value"] if link["type"] == "boardgamecategory"
end

p categories




# p game_info.css("items link").attr('value').value

# p game_info

# p xml_string

# p xml_string.xpath('//items/item/link[@value="boardgamecategory"]')

# p xml_string.css("items link").attr('value').value
