require_relative '../../../../test/helpers/minitest_helper'
require 'json'

#I need to adjust all of the .osm geometry folders so that the Standards Number of Above Ground
#stories are equal to Standards Number of Stories - Standards Number above ground stories

geometry_json =JSON.parse('
    {
            "FullServiceRestaurant": {
                "above_ground_floors": 1,
                "below_ground_floors": 0
            },
            "HighriseApartment": {
                "above_ground_floors": 10,
                "below_ground_floors": 0
            },
            "LargeHotel": {
                "above_ground_floors": 6,
                "below_ground_floors": 1
            },
            "LargeOffice": {
                "above_ground_floors": 12,
                "below_ground_floors": 1
            },
            "MediumOffice": {
                "above_ground_floors": 3,
                "below_ground_floors": 0
            },
            "MidriseApartment": {
                "above_ground_floors": 4,
                "below_ground_floors": 0
            },
            "Outpatient": {
                "above_ground_floors": 3,
                "below_ground_floors": 0
            },
            "PrimarySchool": {
                "above_ground_floors": 1,
                "below_ground_floors": 0
            },
            "QuickServiceRestaurant": {
                "above_ground_floors": 1,
                "below_ground_floors": 0
            },
            "RetailStandalone": {
                "above_ground_floors": 1,
                "below_ground_floors": 0
            },
            "RetailStripmall": {
                "above_ground_floors": 1,
                "below_ground_floors": 0
            },
            "SecondarySchool": {
                "above_ground_floors": 2,
                "below_ground_floors": 0
            },
            "SmallOffice": {
                "above_ground_floors": 1,
                "below_ground_floors": 0
            },
            "Warehouse": {
                "above_ground_floors": 1,
                "below_ground_floors": 0
            },
            "Hospital": {
                "above_ground_floors": 5,
                "below_ground_floors": 1
            },
            "SmallHotel": {
                "above_ground_floors": 4,
                "below_ground_floors": 0
            }
}
'
)

#geometry_folder_path = "#{File.dirname(__FILE__)}/../../../data/geometry/"
geometry_folder_path = "/home/osdev/necb_2011/openstudio-standards/openstudio-standards/data/geometry/"

data_hash =JSON.parse(File.read("#{File.dirname(__FILE__)}/../../refactor/prototypes/common/data/prototype_database.json"))
data_hash.each do |info|
  full_path = geometry_folder_path + info["geometry"]
  model=BTAP::FileIO::load_osm(full_path)

  # Fixing the number of floors problem

  total_floors =  geometry_json[info["building_type"]]["above_ground_floors"].to_i + geometry_json[info["building_type"]]["below_ground_floors"].to_i
    if geometry_json[info["building_type"]]["below_ground_floors"].to_i > 0 
      above_ground_floors = total_floors - geometry_json[info["building_type"]]["below_ground_floors"].to_i
    else
      above_ground_floors = total_floors
    end
  model.building().get.setStandardsBuildingType(info["building_type"])
  model.building().get.setStandardsNumberOfStories(total_floors)
  model.building().get.setStandardsNumberOfAboveGroundStories(above_ground_floors)

  BTAP::FileIO::save_osm(model, full_path)
end
