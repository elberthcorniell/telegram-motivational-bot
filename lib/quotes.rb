# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Style/ClassVars

require 'net/http'
require 'json'

class Quotes
    @url = nil
    def initialize
        file = File.read('./config.json')
        data = JSON.parse(file)
        @url = data["quotes_api_route"]
    end
    def get 
        url = URI(@url)
        JSON.parse(Net::HTTP.get(url)).sample
    end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Style/ClassVars
