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
    total_score += 50 if word.length == 7
    return total_score
  end

#===================VERSION 1:HASH:INCREMENTAL SELECTION============================
# Incremental selection, always update the lastest correct solution at every iteration
# Single pass, only iterate once through the data
  def self.highest_score_from(array_of_words)
    highest_score_and_word = {highest_score: 0, word: ""}
    array_of_words.each do |word|
      score = self.score(word)
      if score > highest_score_and_word[:highest_score]
         highest_score_and_word[:highest_score]=score
         highest_score_and_word[:word]=word
      #if there is a tie..
      elsif score == highest_score_and_word[:highest_score]
        #if the word we are checking is shorter than the current word with the high score
        #(except if the other word has seven letters)
        #then the word we are checking is the new word with the highest score
        if word.length < highest_score_and_word[:word].length and highest_score_and_word[:word].length != 7
          highest_score_and_word[:word]=word
        #else if the word's length is seven and the high score word's length is not 7
        elsif word.length == 7 and highest_score_and_word[:word].length != 7
          highest_score_and_word[:word] = word
        end
      end
    end
    return highest_score_and_word[:word]
  end

# #===================VERSION 2:VARIABLE:INCREMENTAL SELECTION============================
#   def self.highest_score_from_1(array_of_words)
#     highest_score = 0
#     highest_score_word = ""
#
#     # highest_score_and_word = highest_score: 0,word: ""
#     array_of_words.each do |word|
#       score = self.score(word)
#       if score > highest_score
#         highest_score = score
#         highest_score_word = word
#         #if there is a tie..
#       elsif score == highest_score
#         #if the word we are checking is shorter than the current word with the high score
#         #(except if the other word has seven letters)
#         #then the word we are checking is the new word with the highest score
#         if highest_score_word.length == 7
#           # do nothing, because highest_score_word is already
#           # the first 7 tile word of this score
#         else
#           if word.length < highest_score_word.length or word.length == 7
#             highest_score_word = word
#           end
#         end
#       end
#     end
#     return highest_score_word
#   end
#
# #===================VERSION 3:MULTIPASS & FILTER SELECTION============================
# # Multipass & filter selection, handle one requirement at a time
# # filter out incorrect answers and left only the correct ones for next step to handle
# # works like a funnel
#   def self.highest_score_from_2(array_of_words)
#     highest_score = 0
#     highest_score_words = []
#
#     array_of_words.each do |word|
#       score = self.score(word)
#       if score > highest_score
#         highest_score = score
#         highest_score_words = [word]
#       elsif score = highest_score
#         highest_score_words << word
#       end
#     end
#     # Here highest_score_words contains all the word(s) (tied) for the highest score
#
#     # if no tie, directly return the highest_score_word
#     if highest_score_words.length == 1
#       return highest_score_words.first
#     end
#
#     # if there is a tie or multiple ties
#     # consider if there is a 7-letter-word
#     # if so, return the first 7-letter-word
#     if highest_score_words.any? {|word| word.length == 7}
#       return highest_score_words.select{|word| word.length == 7}.first
#     end
#     # if there is no 7-letter-word
#     # then select the minimun length word
#     min_length = highest_score_words.map {|word| word.length}.min
#     return highest_score_words.select{|word| word.length == min_length}.first
# 
#   end
end
