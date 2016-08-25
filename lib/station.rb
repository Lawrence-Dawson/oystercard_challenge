require 'CSV'


class Station
  attr_reader :name, :zone

  def initialize(name: name)
    @name = name
    @zone = zone
  end


end
