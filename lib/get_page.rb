require 'nokogiri'
require 'open-uri'
require 'xpath'
require 'curb'

require_relative '../data/data.rb'

module NokogiriReader
  def self.get_page
    doc = Nokogiri::HTML(open(URL))
  end
end
