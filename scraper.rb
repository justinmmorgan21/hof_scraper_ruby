require 'httparty'
require 'nokogiri'
requ

response = HTTParty.get('https://www.houseoffraser.co.uk/men/hoodies-and-sweatshirts#dcp=1&dppp=59&OrderBy=rank', {
  headers: {"User-Agent" => "Httparty"},
  # debug_output: STDOUT, # To show that User-Agent is Httparty
})

File.write('page1.txt', response.body)

response = HTTParty.get('https://www.houseoffraser.co.uk/men/hoodies-and-sweatshirts#dcp=2&dppp=59&OrderBy=rank', {
  headers: {"User-Agent" => "Httparty"},
  # debug_output: STDOUT, # To show that User-Agent is Httparty
})

File.write('page2.txt', response.body)

document = Nokogiri::HTML4(response.body)
items = document.css('div.s-productthumbbox')
items.each { |div|
  name = div.css('.productdescriptionname').text
  brand = div.css('.productdescriptionbrand').text
  price = div.css('.curprice').text.delete('^0-9.').strip
  item = [name, brand, price]
  puts item
} 