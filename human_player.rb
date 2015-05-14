require './grid.rb'

class HumanPlayer < Player
  attr_reader :name, :grid, :ships

  def initialize(name = "Dave")
    @name = name
    @grid = Grid.new
    @ships = []
  end

  def place_ships(lengths_array)
    lengths_array.each do |l|
      new_ship = Ship.new(l)
      puts "#{@name}, where would you like to place a ship of length #{l}?"
      y = grid.y_of(get_user_input[0])
      x = grid.x_of(get_user_input[/d/].to_s)
      puts "Across or Down?"
      if get_user_input == "Across"
        orientation == true
      else
        orientation == false
      end
      if grid.place_ship(new_ship, x, y, orientation)
        @ships << new_ship
      end
    end
  end


end
