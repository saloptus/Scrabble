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
    return total_score
  end

  def self.highest_score_from(array_of_words)
    highest_score_and_word={highest_score: 0,word: ""}
    array_of_words.each do |word|
      score=self.score(word)
      if score> highest_score_and_word[:highest_score]
        highest_score_and_word[:highest_score]=score
        highest_score_and_word[:word]=word
      
      elsif score==highest_score_and_word[:highest_score]
        if word.length<highest_score_and_word[:word].length
          highest_score_and_word[:word]=word
        end
      end
    end
    return highest_score_and_word[:word]



    #get indices of maxes is an external method (see our extension of the Array class in Array.rb)
    #get indices of maxes returns an array of the indicies of all the maxes in an array
    #[1,2,3,3].get_indices_of_maxes => [2,3] 
    #the length of the returned array is the number of ties

    #if the number of maxes in word_scores is one then do ...
    # maxes_indices=word_and_score.values.get_indices_of_maxes
    
    #if there is only one max (no tie)
    # if maxes_indices.length == 1
    #   return array_of_words[maxes_indices[0]]
    # #if there is more than one max (a tie of some sort)
    # elsif maxes_indices.length>1
    #   word_lengths=word_and_score.keys.map {|key| [key, key.length]}


      #return word_and_score.key([word_lengths.min])

    #  #word_lengths=[]
    #   tied_words=[]
      
    #   #This block returns the words with the tied max score
    #   maxes_indices.each do |tie_index|
    #     tied_words<< array_of_words[tie_index]
    #   end
    #   word_lengths=[]
    #   tied_words.each do |word|
    #    word_hash= word.length
    #   #There could be a tie..like the words could be the same length--need to handle that
    #   word_lengths.min
    #end
  end

end
Scrabble::Scoring.highest_score_from(["Maya","Quai", "Zb"])


#puts Scrabble::Scoring.score("Quai")
