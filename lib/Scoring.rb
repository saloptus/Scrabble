require_relative './Scrabble'
require_relative './String'

class Scrabble::Scoring
  def self.score(word)
    raise ArgumentError unless word.class == String
    raise ArgumentError if word.is_numerical_string?
    raise ArgumentError if word.length < 2

    letters = word.upcase.split(//) # return an array of letters of the word

    letters.each_with_index do |letter, index|
      # return the score(the value of SCRABBLE) assign/replace it with the score that the letter gets
      letters[index] = Scrabble::SCORE_CHART[letter]
    end
    # add up the total score in the array
    total_score = letters.inject(0) {|total, individual_score| total + individual_score}
    total_score+=50 if word.length==7
    return total_score
  end

  def self.highest_score_from(array_of_words)
    highest_score_and_word = {highest_score: 0,word: ""}
    array_of_words.each do |word|
      score = self.score(word)
      if score > highest_score_and_word[:highest_score]
        highest_score_and_word[:highest_score]=score
        highest_score_and_word[:word]=word
      #if there is a tie..
      elsif score==highest_score_and_word[:highest_score]
        #if the word we are checking is shorter than the current word with the high score 
        #(except if the other word has seven letters)
        #then the word we are checking is the new word with the highest score
        if word.length<highest_score_and_word[:word].length and highest_score_and_word[:word].length !=7
          highest_score_and_word[:word]=word
        #else if the word's length is seven and the high score word's length is not 7
        elsif word.length==7 and highest_score_and_word[:word].length!= 7
           highest_score_and_word[:word]=word
        end
      end
    end
    return highest_score_and_word[:word]
  end
end

