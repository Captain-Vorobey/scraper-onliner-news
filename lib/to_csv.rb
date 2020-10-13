require 'csv'

require_relative '../data/data.rb'

class ParsePage
  def parse_page(file_name, array)
    CSV.open(file_name + '.csv', 'w') do |csv|
      csv << %w[Name Label Image]
      array.each do |item|
        csv << [item.name, item.label, item.image_url]
      end
    end
  end
end
