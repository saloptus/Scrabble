require_relative 'spec_helper'
require_relative '../lib/Board.rb'#file name(as same as class name)

describe Scrabble::Board do

	it "A word 'bag' can not be placed outside the Scrabble board(row 0, coloum 14-16), if so return nil" do
	  expect( Scrabble::Board.new.can_place_on_board("bag",0,14,:horizontal) ).must_equal(nil)
	end

	it "A word 'bag' can be placed on board on position(row 0, coloum 8-10); add the word into array of tiles to be placed and return this array" do
	  expect( Scrabble::Board.new.can_place_on_board("bag",0,8,:horizontal) ).must_equal(['b','a','g'])
	end

	it "Plan to place a word 'bag' on (row 0, coloum 8-10). If letter 'a' is already placed on the same position(row 0, coloum 9), add 'b' and 'g' in to the array of tiles to be placed" do
		board = Scrabble::Board.new
		board.place_letter_at(0,9,'a')
		expect( board.can_place_on_board("bag",0,8,:horizontal) ).must_equal(['b','g'])
	end

	it "Plan to place a word 'bag' on (row 0, coloum 8-10). If letter 'z' is already placed on the same position(row 0, coloum 9), return nil" do
		board = Scrabble::Board.new
		board.place_letter_at(0,9,'z')
		expect( board.can_place_on_board("bag",0,8,:horizontal) ).must_equal(nil)
	end

	it "Plan to place a word 'bag' on (row 0, coloum 8-10). If 'b','a','g' is already placed on the same position(row 0, coloum 8-10), return nil" do
		board = Scrabble::Board.new
		board.place_letter_at(0,8,'b')
		board.place_letter_at(0,9,'a')
		board.place_letter_at(0,10,'g')
		expect( board.can_place_on_board("bag",0,8,:horizontal) ).must_equal(nil)
	end

	it "Plan to place a word 'bag' on (row 0, coloum 8-10). If letter 'a' is already placed on the same position(row 0, coloum 9), return true for word is connected" do
		board = Scrabble::Board.new
		expect( board.word_is_connected(3, ["b","g"]) ).must_equal(true)
	end

	it "Plan to place a word 'bag' on (row 0, coloum 8-10). If letter 'q'(row 1, coloum 9) is placed directly below letter 'a'(row 0, coloum 9), return true for word is adjacent" do
		board = Scrabble::Board.new
		board.place_letter_at(1,9,'q')
		expect( board.word_is_adjacent(3,0,8,:horizontal) ).must_equal(true)
	end

	it "Plan to place a word 'bag' on (row 0, coloum 8-10). Another word 'yum' is placed at(row 3, coloum 8-10), return false for word is adjacent" do
		board = Scrabble::Board.new
		board.place_letter_at(3,8,'y')
		board.place_letter_at(3,9,'u')
		board.place_letter_at(3,10,'m')
		expect( board.word_is_adjacent(3,0,8,:horizontal) ).must_equal(false)
	end

	it "When start new board, return true for board is empty" do
		board = Scrabble::Board.new
		expect( board.is_empty_board ).must_equal(true)
	end

	it "Plan to place a word 'bag' on (row 7, coloum 7-9), immediately after start a new board, return true for is first word and can play word" do
			board = Scrabble::Board.new
			expect( board.is_first_word(3,7,7,:horizontal) ).must_equal(true)
			expect( board.can_play_word("bag",7,7,:horizontal) ).must_equal(true)
	end

end
