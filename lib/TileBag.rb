require_relative './Scrabble'
# require_relative './Scoring'

class Scrabble::TileBag
  attr_reader :tiles_remaining, :tile_bag
  def initialize
    @tile_bag = {
      "A" => 9,"B" => 2,"C" => 2,"D" => 4,
      "E" => 12,"F" => 2,"G" => 3,"H" => 2,
      "I" => 9,"J" => 1,"K" => 1,"L" => 4,
      "M" => 2,"N" => 6,"O" => 8,"P" => 2,
      "Q" => 1,"R" => 6,"S" => 4,"T" => 6,
      "U" => 4,"V" => 2,"W" => 2,"X" => 1,
      "Y" => 2,"Z" => 1
    }
    @tiles_remaining = @tile_bag.values.inject(0){|sum, num_of_tiles| sum + num_of_tiles}
  end

  def draw_tiles(num)
    tiles = []
    num.times do
      new_tile = @tile_bag.keys.sample
      until @tile_bag[new_tile] != 0
        new_tile = @tile_bag.keys.sample
        if @tile_bag.values.all?{|num_of_tile| num_of_tile == 0}
          return nil
        end
      end
      tiles << new_tile
      @tile_bag[new_tile] -= 1
      @tiles_remaining -= 1
      # When the quantity of a letter is 0, the player can not draw this letter anymore
      # whenever the quantity of a letter is 0, delete that tile from tile_bag to make sure it will not be sampled in the future.
      # if @tile_bag[new_tile] == 0
      #   @tile_bag.delete(new_tile)
      # end
    end
    return tiles
  end
end

# t = Scrabble::TileBag.new
# 100.times do
#     t.draw_tiles(7)
# end
# puts @tiles_remaining
