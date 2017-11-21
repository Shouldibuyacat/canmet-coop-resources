#converts csv to json

require 'csv'
require 'json'


csv_file = "#{File.dirname(__FILE__)}/../btap/FutureUse_Weather-System_Data.csv"

data_hash = CSV.open(csv_file, :headers => true).map { |x| x.to_h }.to_json

File.write("#{File.dirname(__FILE__)}/../btap/csvToJson.json",data_hash)

data_json_hash = JSON.parse(File.read("#{File.dirname(__FILE__)}/../btap/csvToJson.json"))

pretty_output = JSON.pretty_generate(data_json_hash)

#this part converts it into the format of the WeatherData1 hash found at
#https://github.com/NREL/openstudio-standards/blob/nrcan/openstudio-standards/lib/openstudio-standards/weather/Weather.Model.rb
pretty_output.to_s.gsub!('"','')
pretty_output.to_s.gsub!(/\\/,'')

File.delete("#{File.dirname(__FILE__)}/../btap/csvToJson.json")

File.write("#{File.dirname(__FILE__)}/../btap/csvToJson.json", pretty_output)
