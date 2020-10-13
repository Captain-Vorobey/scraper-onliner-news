#!/usr/bin/env ruby

require_relative 'lib/adding_parsed_array'
require_relative 'lib/article_parser'
require_relative 'data/data.rb'

puts "Wait a bit please..."

html = Curl.get(URL)

array = AddingParsedArray.new([], html).push_to_articles

for item in array 
    p item.name
    p item.label
    p item.image_url
end

def array.arr_to_file(arr)
	return ParsePage.new().parse_page(FILE_NAME, arr)
end

array.arr_to_file(array)

puts "The file is written!"