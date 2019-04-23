require 'sinatra'
require './Rbeth.rb'

eth_scraper = EthScraper.new()

get '/:number' do |number|
    arr = eth_scraper.richest_addresses(number)
    arr.to_json
end