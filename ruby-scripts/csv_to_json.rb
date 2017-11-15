#converts csv to json

#notes you will have to change the paths in order for the script to work on your local system
#if we saved our files in different directories

require 'csv'
require 'json'

csv_file = "#{File.dirname(__FILE__)}/../btap/FutureUse_Weather-System_Data.csv"

data_hash = CSV.open(csv_file, :headers => true).map { |x| x.to_h }.to_json

File.write("#{File.dirname(__FILE__)}/../btap/csvToJson.json",data_hash)

data_json_hash = JSON.parse(File.read("#{File.dirname(__FILE__)}/../btap/csvToJson.json"))

pretty_output = JSON.pretty_generate(data_json_hash)

File.delete("#{File.dirname(__FILE__)}/../btap/csvToJson.json")

File.write("#{File.dirname(__FILE__)}/../btap/csvToJson.json", pretty_output)

puts pretty_output
