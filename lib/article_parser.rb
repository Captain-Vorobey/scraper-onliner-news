require 'capybara'
require 'selenium-webdriver'

require_relative 'get_page'

class ArticleParser
  include NokogiriReader

  attr_accessor :name, :label, :image_url, :url, :browser

  def initialize(article_name, label, image_url, url)
    # Capybara.app_host = URL
    @name = article_name
    @label = label
    @image_url = image_url
    NokogiriReader.initial_setup
    @browser = Capybara.current_session
    @url = url
    @browser.visit(url)
  end

  def self.get_name(_name, url)
    NokogiriReader.initial_setup
    @browser = Capybara.current_session
    @url = url
    @browser.visit(url)
    res = @browser.all(:xpath, _name)
    res1 = []
    res.each do |el|
      res1.push(el.text)
    end
    res1
  end

  def self.get_img(_img, url)
    #article_img = doc.xpath(_img)
    NokogiriReader.initial_setup
    @browser = Capybara.current_session
    @url = url
    @browser.visit(url)
    res = @browser.all(:xpath, _img)
    res1 = []
    res.each do |el|
      res1.push(el['style'].strip) # .map { |a| a['style'].match(/^.*:\s*url\((\".*\")\)/).captures[0] })
    end
    res1
  end
  # news-entry__speech
  def self.get_label(_label, url)
    NokogiriReader.initial_setup
    @browser = Capybara.current_session
    @url = url
    @browser.visit(url)
    #@browser.find_by_id('//*[class="b-tile-main"]').click
    @browser.all(:css, _label)
  end
end
