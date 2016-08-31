require_relative 'spec_helper'
require_relative '../lib/Player.rb'#file name(as same as class name)

describe Scrabble::Player do

  it "Quai's name is 'Quai'" do
    expect( Scrabble::Player.new("Quai").name ).must_equal("Quai")
  end

  it "The player plays the word 'dog' and continue playing the game(true) and the score of the word" do
    b1 = true
    b2 = 5

    a1, a2 = Scrabble::Player.new("Quai").play("dog")
    expect(b1).must_equal(a1)
    expect(b2).must_equal(a2)
  end

  it "The player('Quai')'s total score after playing the word 'dog' and 'cat' is 10" do
    p = Scrabble::Player.new("Quai")
    p.play("dog")
    p.play("cat")
    expect(p.total_score).must_equal(10)
  end

  it "The player wins when score is over 100 points" do
    p = Scrabble::Player.new("Quai")
    p.play("zzzzzzz")
    expect(p.won?).must_equal(true)
  end

  it "The player doesn't win when score is less than 100 points" do
    p = Scrabble::Player.new("Maya")
    p.play("cat")
    expect(p.won?).must_equal(false)
  end

  it "The player's highest scoring word is 'zzzzzzz'" do
    p = Scrabble::Player.new("Quai")
    p.play("zzzzzzz")
    p.play("cat")
    expect(p.highest_scoring_word).must_equal("zzzzzzz")
  end

  it "The player's highest word score is 120" do
    p = Scrabble::Player.new("Quai")
    p.play("zzzzzzz")
    p.play("cat")
    expect(p.highest_word_score).must_equal(120)
  end

end
  # it '""(empty string) raises an ArgumentError' do
  #     expect( proc {Scrabble::Scoring.score("")} ).must_raise ArgumentError
  # end
