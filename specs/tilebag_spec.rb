require_relative 'spec_helper'
require_relative '../lib/TileBag'#file name(as same as class name)

describe Scrabble::TileBag do

  it "The .new method initalizes a TileBag object" do
    expect(Scrabble::TileBag.new.class).must_equal(Scrabble::TileBag)
  end

  it "an initialized tile bag makes a tile bag with 98 tiles" do
    expect(Scrabble::TileBag.new.tiles_remaining).must_equal(98)
  end

  it "draw one(1) tile, returns a one-character string'" do
    expect(Scrabble::TileBag.new.draw_tiles(1).class).must_equal(Array)
    expect(Scrabble::TileBag.new.draw_tiles(1).length).must_equal(1)
  end

  it "an initialized tile bag makes a tile bag with 98 tiles" do
    expect(Scrabble::TileBag.new.tiles_remaining).must_equal(98)
  end

  #When the quantity of a letter is 0, the player can not draw this letter any more
  it "When the quantity of a letter is 0, the player can not draw this letter any mores" do
    t = Scrabble::TileBag.new
    100.times do
        t.draw_tiles(7)
    end
    expect(t.tile_bag["A"]).must_equal(0)
  end



  #if there is nothing left in remaing_tiles, exit the game


  # it "Quai's name is 'Quai'" do
  #   expect(Scrabble::TileBag.new.draw_tiles(1).class).must_equal(String)
  #   Scrabble::TileBag.new.draw_tiles(1).length.must_equal(1)
  # end

end
