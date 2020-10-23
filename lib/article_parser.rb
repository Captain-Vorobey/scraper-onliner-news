require 'capybara'
require 'selenium-webdriver'

class ArticleParser
  attr_accessor :name, :label, :image_url, :url, :browser

  def initialize(article_name, label, image_url, url)
    @name = article_name
    @label = label
    @image_url = image_url

    initial_setup
    @browser = Capybara.current_session
    @url = url
    @browser.visit(url)
  end

  attr_reader :browser

  def get_name(_name)
    data = browser.all(:xpath, _name)
    names = []
    data.each do |el|
      names.push(el.text)
    end
    names
  end

  def get_img(_img)
    data = browser.all(:xpath, _img)
    images = []
    data.each do |el|
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
