require_relative './Scrabble'
require 'awesome_print'

class Scrabble::Board
  @@board = [
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],["t"],["e"],["a"],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
    [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]]
  ]

def self.get_positions(word_length, position, direction)
  x = position[0]
  y = position[1]
  array_of_positions =[]
  array_of_positions = [[y,x]]# position = [1,3]

  (word_length - 1).times do
    if direction == :horizontal
      position[1] += 1
      array_of_positions << [y,x]
      puts array_of_positions
    elsif direction == :vertical
      position[0] += 1
      array_of_positions << position
    end
end
  ap array_of_positions
  return array_of_positions # return an array of array e.g.[[1,2],[1,3],[1,4]]

end

def self.place_on_board(word, position, direction)
  #check if the spot of the word is empty
  array_of_positions = get_positions(word.length, position, direction)
  word.split(//).each_with_index do |letter, index|
    position_of_letter = array_of_positions[index]
      # position_of_letter.first returns x axis position, position_of_letter.last returns y axis position
    # ap print position_of_letter
    element_at_targeted_position = @@board[position_of_letter.first][position_of_letter.last]
    if  element_at_targeted_position != nil
      # if any of the letter in the word's spot is occupied, return false
      return false

    elsif position_of_letter.last > @@board[0].length
      return false
    end
    puts "hello"
  element_at_targeted_position = letter

  end
  # ap print @@board
end





# 2. check if the letter is connected to a valid word
  # 2.1 check four directions, determine which direction has a letter
  # 2.2 check in that direction, determine where the "word" ends (till it finds the first empty spot)
  # 2.3 check if that "word" is a valid word
# 3. check whether the connected letter(s) (each) connected to a valid word
  # 3.1 examine the connected letter, see four directions, see if the letter connected to another letter other than examined orgin spot
  # 3.2 go through that direction, repeat 2.1 - 2.3, expect skip the previous examined spot

end

Scrabble::Board.place_on_board("thespian",[0,8],:horizontal)
