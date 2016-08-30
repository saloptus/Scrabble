require_relative './Scrabble'
require_relative './String'

class Scrabble::Scoring
  def self.score(word)
    raise ArgumentError unless word.class == String
    raise ArgumentError if word.is_numerical_string?
    raise ArgumentError if word.length < 2

    letters = word.upcase.split(//) # return an array of letters of the word
    #print letters
    letters.each_with_index do |letter, index|
      # return the score(the value of SCRABBLE) assign/replace it with the score that the letter gets
      #puts letter
      letters[index] = Scrabble::SCORE_CHART[letter]

      # puts " letter[#{index}] = #{letters[index]}"
      # puts " letters[#{index}] = #{letter}"

    end
    # add up the total score in the array
    total_score = letters.inject(0) {|total, individual_score| total + individual_score}
    return total_score
  end

end



puts Scrabble::Scoring.score("Quai")
