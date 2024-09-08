require 'httparty'

response = HTTParty.get('https://www.houseoffraser.co.uk/men/hoodies-and-sweatshirts', {
  headers: {"User-Agent" => "Httparty"},
  debug_output: STDOUT, # To show that User-Agent is Httparty
})
puts response.body