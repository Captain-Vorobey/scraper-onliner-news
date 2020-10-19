require_relative 'get_page'

class ArticleParser
  include NokogiriReader

  attr_accessor :name, :label, :image_url, :doc

  def initialize(article_name, label, image_url, _doc)
    @name = article_name
    @label = label
    @image_url = image_url
    @doc = NokogiriReader.get_page
  end

  def self.get_name(_name, doc)
    article_name = doc.xpath(NAME).text.strip
  end

  def self.get_img(_img, doc)
    article_img = doc.xpath(IMAGE)
  end

  def self.get_label(_label, doc)
    article_label = doc.xpath(LABEL).map { |el| el.text.slice(0, 200) }
  end
end
