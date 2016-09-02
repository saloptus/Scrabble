require_relative './Scrabble'
# require_relative 'clean_word_list.csv'
require 'csv'
# require_relative './Scoring'
# require_relative './TileBag'

# ===============Preparation===================
# Obtained a text file with word list for 40,000+ English words and changed the file to csv
# Cleaned the csv file by taking out words that contains symbles and numbers
# with ../assets/clean_word_list.rb
#==============================================

class Scrabble::Dictionary
  attr_reader

  # def initialize
  # #read in csv file of word list
  #
  # end

  def self.in_dictionary?(word)
    # csv_word_list = CSV.open('clean_word_list.csv', 'r')

	#a class method
    # puts csv_word_list.read
    # for each word in csv, if the word the person played is matches a word in dictionary
    # return true
    CSV.foreach('lib/clean_word_list.csv','r') do |row|
      if row[0] == word
        return true
      end
    end
    # after all the words in the dictionary have been checked...
  	# return false because the word didn't match any words in the dictionary
    return false
  end

end

# Scrabble::Dictionary.in_dictionary?("the")
# Scrabble::Dictionary.in_dictionary?("zzzzzzb")
