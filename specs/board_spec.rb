require_relative 'spec_helper'
require_relative '../lib/Board.rb'#file name(as same as class name)

describe Scrabble::Board do

	it "A word 'bag' can not be placed outside the Scrabble board, if so return false" do
	    expect( Scrabble::Board.place_on_board("bag",[0,14],:horizontal) ).must_equal(false)
	 end

   it "Two words can not be placed on top of each other" do
     Scrabble::Board.place_on_board("thespian",[0,8],:horizontal)
     expect( Scrabble::Board.place_on_board("bag",[0,14],:horizontal) ).must_equal(false)
 	 end

end
