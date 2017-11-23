#converts xlsx to json using rubyXL

require 'csv'
require 'json'
require 'rubyXL'

begin

csv_file = "/home/osdev/necb_2011/forks/openstudio-standards/openstudio-standards/lib/openstudio-standards/btap/csvFile1.csv"
input_file = "/home/osdev/necb_2011/forks/openstudio-standards/openstudio-standards/lib/openstudio-standards/btap/WeatherData1.xlsx"

CSV.open(csv_file, "wb") do |csv|
  workbook = RubyXL::Parser.parse input_file
  worksheet = workbook[0]

  worksheet.each_with_index do |row, row_idx|
    row_data = []
    (0...row.size).each do |col_idx|
      begin
        cell = row[col_idx]
        val = cell.value
        row_data << val
      rescue NoMethodError
        row_data << ""
      end
    end
    csv << row_data
  end
end

rescue; end


csv_file = "#{File.dirname(__FILE__)}/../btap/csvFile1.csv"

data_hash = CSV.open(csv_file, :headers => true).map { |x| x.to_h }.to_json

File.write("#{File.dirname(__FILE__)}/../btap/csvToJsonUpdate.json",data_hash)

data_json_hash = JSON.parse(File.read("#{File.dirname(__FILE__)}/../btap/csvToJsonUpdate.json"))

pretty_output = JSON.pretty_generate(data_json_hash)

#this part converts it into the format of the WeatherData1 hash found at
#https://github.com/NREL/openstudio-standards/blob/nrcan/openstudio-standards/lib/openstudio-standards/weather/Weather.Model.rb
#pretty_output.to_s.gsub!('"','')
#pretty_output.to_s.gsub!(/\\/,'')

File.delete("#{File.dirname(__FILE__)}/../btap/csvToJsonUpdate.json")

File.write("#{File.dirname(__FILE__)}/../btap/WeatherData1.json", pretty_output)
