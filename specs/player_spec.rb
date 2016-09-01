require_relative 'spec_helper'
require_relative '../lib/Player.rb'#file name(as same as class name)

describe Scrabble::Player do

  it "Quai's name is 'Quai'" do
    expect( Scrabble::Player.new("Quai").name ).must_equal("Quai")
  end

  it "The player plays the word 'dog' and continue playing the game(true) and the score of the word" do
    p=Scrabble::Player.new("Quai")
    p.tiles=["d","o","g","a","a","a","a","n"]
    
    a1, a2 = p.play("dog")
  
    b1 = true
    b2 = 5

    expect(b1).must_equal(a1)
    expect(b2).must_equal(a2)
  end

  it "The player('Quai')'s total score after playing the word 'dog' and 'cat' is 10" do
    p = Scrabble::Player.new("Quai")
    p.tiles=["d","o","g","a","a","a","a","n"]
    p.play("dog")
    p.tiles=["a","b","c","t","d","e","t"]
    p.play("cat")
    expect(p.total_score).must_equal(10)
  end

  it "The player wins when score is over 100 points" do
    p = Scrabble::Player.new("Quai")
     p.tiles=["z","z","z","z","z","z","z"]
    p.play("zzzzzzz")
    expect(p.won?).must_equal(true)
  end

  it "The player doesn't win when score is less than 100 points" do
    p = Scrabble::Player.new("Maya")
    p.tiles=["a","b","c","t","d","e","t"]
    p.play("cat")
    expect(p.won?).must_equal(false)
  end

  it "The player's highest scoring word is 'zzzzzzz'" do
    p = Scrabble::Player.new("Quai")
    p.tiles=["z","z","z","z","z","z","z"]
    p.play("zzzzzzz")
    p.tiles=["a","b","c","t","d","e","t"]
    p.play("cat")
    expect(p.highest_scoring_word).must_equal("zzzzzzz")
  end

  it "The player's highest word score is 120" do
    p = Scrabble::Player.new("Quai")
    p.tiles=["z","z","z","z","z","z","z"]
    p.play("zzzzzzz")
    p.tiles=["a","b","c","t","d","e","t"]
    p.play("cat")
    expect(p.highest_word_score).must_equal(120)
  end

  it "Calling player.tiles gives you the current tiles of the player" do
    p=Scrabble::Player.new("Quai")
    t=Scrabble::TileBag.new
    p.draw_tiles(t)
    expect(p.tiles.class).must_equal(Array)
    expect(p.tiles.first.class).must_equal(String)
    expect(p.tiles.first.length).must_equal(1)
  end

  it "When the game starts, the player should start with 7 tiles" do
    p=Scrabble::Player.new("Quai")
    t=Scrabble::TileBag.new
    p.draw_tiles(t)
    expect(p.tiles.length).must_equal(7)
  end

  it "When the player has 3 tiles at hand, then draw tiles gives the player 4 tiles (7 total)" do
    p=Scrabble::Player.new("Quai")
    t=Scrabble::TileBag.new
    p.draw_tiles(t)
    p.play(p.tiles[0..2].join)
    p.draw_tiles(t) 
    expect(p.tiles.length).must_equal(7)
  end

  it "When the player plays tiles, then those tiles are removed from his/her hand" do
    p=Scrabble::Player.new("Quai")
    t=Scrabble::TileBag.new
    p.draw_tiles(t)
    p.play(p.tiles[0..2].join)
    expect(p.tiles.length).must_equal(4)
  end

  it "The player can't play a word when any of the letters are not included in their tiles" do
    p=Scrabble::Player.new("Quai")
    t=Scrabble::TileBag.new
    p.draw_tiles(t)
    p.tiles=["a","a","a","a","a"]
    expect(proc{p.play("dog")}).must_raise ArgumentError
    #expect( proc {Scrabble::Scoring.score(3)} ).must_raise ArgumentError
  end

end
  # it '""(empty string) raises an ArgumentError' do
  #     expect( proc {Scrabble::Scoring.score("")} ).must_raise ArgumentError
  # end
