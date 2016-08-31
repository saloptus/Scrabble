require_relative './Scrabble'
require_relative './Scoring'

class Scrabble::Player
  attr_reader :name, :plays, :total_score
  def initialize(name)
    @name = name
    @plays = []
    @total_score = 0
  end

  def play(word)
    @plays << word
    continue_play = true
    if won?
      continue_play = false
    end

    score = Scrabble::Scoring.score(word)
    @total_score += score
    return continue_play, score
  end

  def won?
    # hide the instance variable by using attr_reader :total_score, call the .total_score in the end
    if total_score > 100
      return true
    else
      return false
    end
  end

  def highest_scoring_word
    return Scrabble::Scoring.highest_score_from(plays)
  end

  def highest_word_score
    return Scrabble::Scoring.score(highest_scoring_word)
  end


end

# Scrabble::Player.new("Quai").play("dog")
