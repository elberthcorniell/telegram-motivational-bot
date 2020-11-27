require 'net/http'
require 'json'

class Quotes
  attr_reader :url

  def initialize
    file = File.read('./config.json')
    data = JSON.parse(file)
    @url = data['quotes_api_route']
  end

  def get
    url = URI(@url)
    JSON.parse(Net::HTTP.get(url)).sample
  end
end
