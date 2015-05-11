class Ship
  attr_reader :length, :place, :ship_locations

  def initialize(length)
    @length = length
    @place = false
    @ship_locations = []
  end

  def place(x, y, orientation=true)
    if @place == false
      @place = [x, y, orientation]
      x_start = @place[0]
      y_start = @place[1]
      if orientation == true
        (x_start..x_start + @length-1).each do |x|
          location = [x, y_start]
          @ship_locations << location
        end
      else
        (y_start..y_start + @length -1).each do |y|
          location = [x_start, y]
          @ship_locations << location
        end
      end
    end
  end

  def covers?(x, y)
    @ship_locations.include?([x, y])
  end

  def overlaps_with?(other_ship)
    !(@ship_locations & other_ship.ship_locations == [])
  end

  def fire_at(x, y)
    @ship_locations.include?([x, y])
  end


end
