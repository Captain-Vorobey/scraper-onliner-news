require 'nokogiri'
require 'open-uri'
require 'xpath'
require 'curb'
require 'capybara'

require_relative '../data/data.rb'

module NokogiriReader
  def NokogiriReader.get_page
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    
    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|
      config.default_max_wait_time = 10
      config.default_driver = :selenium
    end
    
    browser = Capybara.current_session
    driver = browser.driver.browser
    browser.visit URL

    doc = Nokogiri::HTML(driver.page_source);
	end
end
