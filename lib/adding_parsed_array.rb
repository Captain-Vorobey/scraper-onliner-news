require_relative '../data/data.rb'
require_relative 'article_parser'
require_relative 'to_csv'

class ArrayScraper
  attr_accessor :articles, :doc

  def initialize(_doc)
    @articles = []
    @doc = URL
  end

  def push_to_articles
    article = ArticleParser.new(doc)

    article_image = article.get_img(IMAGE)
    article_name = article.get_name(NAME)
    article_label = article.get_label(LABEL)

    articles.push(image: article_image, name: article_name, label: article_label)
  end
end
