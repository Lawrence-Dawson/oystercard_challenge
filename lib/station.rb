require 'CSV'


class Station
  attr_reader :name, :zone

  def initialize(station_name, zone)
    @name = station_name
    @zone = zone
  end

  # def load_stations_ref
  #   @stations_ref = {}
  #   Dir.chdir(File.dirname(__FILE__)) #IDK WHAT THIS DOES? but it fixes shit. SO KEEP IT!
  #
  #   CSV.foreach("London_stations.csv") do |row|
  #     @stations_ref[row[3]] = row[5].to_i
  #   end
  #
  #   1
  # end
end
