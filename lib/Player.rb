require_relative './Scrabble'
require_relative './Scoring'
require_relative './TileBag'


class Scrabble::Player
  attr_reader :name, :plays, :total_score
  attr_accessor :tiles
  def initialize(name)
    @name = name
    @plays = []
    @total_score = 0
    @tiles=[]
  end

  def play(word)
    raise ArgumentError if  word.split(//).any? {|letter| !tiles.include?(letter)}
        #"You don't tiles to play that word"
      #interation class (game class?) will catch this error and put a message out to the player
      #catch puts 
    

    @plays << word
    continue_play = true
    if won?
      continue_play = false
    end
    if tiles.length>0
      remove_tiles(word)
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

  def remove_tiles(word)
    letters=word.split(//)
    letters.each do |del|
      tiles.delete_at(tiles.index(del))
    end
  end


  def highest_scoring_word
    return Scrabble::Scoring.highest_score_from(plays)
  end

  def highest_word_score
    return Scrabble::Scoring.score(highest_scoring_word)
  end

  def draw_tiles(tilebag)
    until @tiles.length==7
      @tiles<<tilebag.draw_tiles(1).first
    end
  end
end

# Scrabble::Player.new("Quai").play("dog")
