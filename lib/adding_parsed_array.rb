require 'xpath'

require_relative '../data/data.rb'
require_relative 'article_parser'
require_relative 'get_page'
require_relative 'to_csv'

class AddingParsedArray
  attr_accessor :articles, :doc

  def initialize(articles, _doc)
    @articles = articles
    @doc = URL
  end

  def push_to_articles
    article = ArticleParser.new(NAME, LABEL, IMAGE, doc)

    article_name = ArticleParser.get_name(NAME, doc)
    article_label = ArticleParser.get_label(doc, LABEL)
    #article_image = ArticleParser.get_img(IMAGE, doc)

    #articles.push(ArticleParser.new(article_name, article_label, article_image, doc))
  end
end
