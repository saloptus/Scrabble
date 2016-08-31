require_relative 'spec_helper'
require_relative '../lib/Scoring.rb'#file name(as same as class name)

describe Scrabble::Scoring do

  it '"Maya" score is 9' do
    expect( Scrabble::Scoring.score("Maya") ).must_equal(9)
  end

  it '"Quai" score is 13' do
    expect( Scrabble::Scoring.score("Quai") ).must_equal(13)
  end

  it '""(empty string) raises an ArgumentError' do
      expect( proc {Scrabble::Scoring.score("")} ).must_raise ArgumentError
  end

  it 'A non-string raises an ArgumentError' do
    expect( proc {Scrabble::Scoring.score(3)} ).must_raise ArgumentError
  end

  it 'A non-letter string raises an ArgumentError' do
    expect( proc {Scrabble::Scoring.score("3")} ).must_raise ArgumentError
  end

  it 'A ONE letter string raises an ArgumentError' do
    expect( proc {Scrabble::Scoring.score("A")} ).must_raise ArgumentError
  end

  it 'Of "Maya" and "Quai", "Quai" has the highest score' do
    expect( Scrabble::Scoring.score("Quaiaaa") ).must_equal(66)
  end

  it 'Of "Maya" and "Quai", "Quai" has the highest score' do
    expect( Scrabble::Scoring.highest_score_from(["Quai","Maya"]) ).must_equal("Quai")
  end

  it 'Of "Maya","Quai", and "Zb", "Zb wins" ' do
    expect( Scrabble::Scoring.highest_score_from(["Quai","Maya", "Zb"]) ).must_equal("Zb")
  end

  it 'Of "Maya","Quai", and "Zb", "Zb wins" ' do
    expect( Scrabble::Scoring.highest_score_from(["aaaaad", "Maya", "Zzzzzj"]) ).must_equal("aaaaad")
  end


end
