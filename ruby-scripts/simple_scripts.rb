require_relative '../../../test/helpers/minitest_helper'
require 'json'
#SCRIPT 1:
#this script copies all the geometry files from one directory into another directory called GeometrySandbox
#----------------------------------------------------------------------------------------------------------
=begin
geom_path = Dir.glob("#{File.dirname(__FILE__)}/../../../data/geometry/*.osm").sort

geom_path.each {|filename|
      name = File.basename('filename','.osm'),
      dest_folder ="/home/osdev/necb_2011/openstudio-standards/openstudio-standards/data/geometry/GeometrySandbox/#{name}"
      FileUtils.cp(filename, dest_folder)}
=end

#SCRIPT 2:
#I want to parse the geometry.json file in the geometrySandbox directory
#and then change the values for QuickServiceRestaurant, FullServiceRestaurant, and SmallOffice
#regarding number of above ground floors to not include attics as a floor
#-----------------------------------------------------------------------------------------------------------
#load input file
#converting JSON file to Hash
=begin
data_hash = JSON.parse(File.read("#{File.dirname(__FILE__)}/../../../data/geometry/geometry.json"))

data_hash["NECB 2011"]["FullServiceRestaurant"] = {"above_ground_floors" => 1, "below_ground_floors" => 0}
data_hash["NECB 2011"]["QuickServiceRestaurant"] = {"above_ground_floors" => 1, "below_ground_floors" => 0}
data_hash["NECB 2011"]["SmallOffice"] = {"above_ground_floors" => 1, "below_ground_floors" => 0}


pretty_output = JSON.pretty_generate(data_hash)

File.write("#{File.dirname(__FILE__)}/../../../data/geometry/geometry_mod.json", pretty_output)
=end
