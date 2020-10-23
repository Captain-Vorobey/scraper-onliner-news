require 'capybara'
require 'selenium-webdriver'

class ArticleParser
  attr_reader :url, :browser

  def initialize(url)
    initial_setup
    @browser = Capybara.current_session
    @url = url
    @browser.visit(url)
  end

  def get_name(_name)
    data = browser.all(:xpath, _name)
    names = []
    data.map do |el|
      names.push(el.text)
    end
    names
  end

  def get_img(_img)
    data = browser.all(:xpath, _img)
    images = []
    data.map do |el|
      images.push(el['style'])
    end
    images
  end

  def get_label(_label)
    links = []

    @browser.all(:xpath, '//*[contains(@class,"b-tile m-1x1")]/a[@class="b-tile-main"]').each do |row|
      links.push(row['href'])
    end
    data = []

    links.each do |link|
      browser.visit link
      if browser.has_css?(_label)
        text = @browser.find(_label).text.slice(0, 200)
        data.push(text)
      end
    end
    data
  end

  def initial_setup
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    Capybara.default_driver = :selenium
  end
end
