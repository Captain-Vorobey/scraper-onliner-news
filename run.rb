#!/usr/bin/env ruby

require_relative 'lib/adding_parsed_array'
require_relative 'lib/article_parser'
require_relative 'data/data.rb'

puts 'Wait a bit please...'

array = ArrayScraper.new(URL).push_to_articles

def array.arr_to_file(arr)
  CsvWritable.write(FILE_NAME, arr)
end

array.arr_to_file(array)

puts 'The file is written!'
