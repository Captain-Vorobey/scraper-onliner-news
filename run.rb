#!/usr/bin/env ruby

require 'capybara'

require_relative 'lib/adding_parsed_array'
require_relative 'lib/article_parser'
require_relative 'data/data.rb'

# webdriver configuration for Gecko
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 10
  config.default_driver = :selenium
end

puts 'Wait a bit please...'

browser = Capybara.current_session
driver = browser.driver.browser
browser.visit URL

array = AddingParsedArray.new([], browser).push_to_articles

def array.arr_to_file(arr)
  ParsePage.new.parse_page(FILE_NAME, arr)
end

array.arr_to_file(array)

puts 'The file is written!'
