require 'csv'

require_relative '../data/data.rb'

class ParsePage
    def parse_page(file_name, array)
        CSV.open(file_name + ".csv", "w") do |csv|
            csv << ["Name", "Label", "Image"]
            for item in array
                csv << [item.name, item.label, item.image_url]
            end
        end
    end
end