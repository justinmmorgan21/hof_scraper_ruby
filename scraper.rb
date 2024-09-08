require 'httparty'
require 'nokogiri'

response = HTTParty.get('https://www.houseoffraser.co.uk/men/hoodies-and-sweatshirts', {
  headers: {"User-Agent" => "Httparty"},
  # debug_output: STDOUT, # To show that User-Agent is Httparty
})

document = Nokogiri::HTML4(response.body)
items = document.css('div.s-productthumbbox')
items.each { |div|
  name = div.css('span.productdescriptionname').text
  brand = div.css('span.productdescriptionbrand').text
  price = div.css()
}