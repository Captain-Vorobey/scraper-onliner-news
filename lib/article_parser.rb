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

  def get_name(_name, _url)
    data = @browser.all(:xpath, _name)
    names = []
    data.each do |el|
      names.push(el.text)
    end
    names
  end

  def get_img(_img, _url)
    p res = @browser.all(:xpath, _img)
    res1 = []
    res.each do |el|
      res1.push(el['style'])
    end
    res1
  end

  def get_label(_label, _url)
    links = []

    @browser.all(:xpath, '//*[contains(@class,"b-tile m-1x1")]/a[@class="b-tile-main"]').each do |row|
      links.push(row['href'])
    end
    data = []

    links.each do |link|
      @browser.visit link
      if @browser.has_css?(_label)
        p text = @browser.find(_label).text.slice(0, 200)
        data.push(text)
      end
    end
    data
  end

  def initial_setup
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end

    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|
      config.default_max_wait_time = 10
      config.default_driver = :selenium
    end
  end
end
