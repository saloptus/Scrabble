require_relative './Scrabble'
require 'awesome_print'

class Scrabble::Board

  def initialize
    @board = Array.new(15) { Array.new(15) } # array of arrays with nil as each item. 15 * 15 square board.
  end

  # Design:
  # 0. check if this is the very first word on board
  #   1.1 if so, check if the word cross the middle tile (row 7, coloum 7) => if so, return true
  # 1. check if the word can be placed on board
  #   1.1 the word is placed outside the board => nil
  #   1.2 can be placed on board => EITHER a letter's position is nil OR the position is occupied by a same letter(remember to handle it in tiles_remaining) => return to_be_placed_tile = [], else return nil
  # 2. Once placed, check if one of the letters in the word is already on board or at least one of the letters is adjacent to a word.
  # 3. check the each tile in to_be_placed_tile, check if the letter's top-to-bottom and left-to-right(optimize:only need to go through the opposite direction of its original direction) is also a valid word. Unless it is a single letter in that direction, then consider it is a valid letter.

  # overall method
  def can_play_word(word, start_row, start_coloum, direction)
    length = word.length
    can_place_on_board = self.can_place_on_board(word, start_row, start_coloum, direction)

    if is_first_word(length, start_row, start_coloum, direction)
      return true
    end

    if can_place_on_board == nil
      return false
    end

    if word_is_connected(length, can_place_on_board) ||
      word_is_adjacent(length, start_row, start_coloum, direction)
      return true
    end

    if word_is_valid
      return true
    end

  end

  def is_first_word(length, start_row, start_coloum, direction)
    if is_empty_board

      row = start_row
      coloum = start_coloum

      length.times do
        if row == 7 && coloum == 7
          return true
        end
        if direction == :horizontal
          coloum += 1
        elsif direction == :vertical
          row += 1
        end
      end
      return false
    end
  end

  def is_empty_board
    @board.each do |row|
      row.each do |tile|
        if tile == nil
          return true
        end
      end
    end
  end

  # check if the word can be placed on board
  def can_place_on_board(word, start_row, start_coloum, direction)
    # an instance method, because each tile put on board is a new board with different attributes
    # if the word can place on board, return an array of tiles that are to be placed on board
    # if no tile can be placed on board at all, return nil
    letters = word.split("")
    length = word.length

    to_be_placed_tiles = []
    board_values = self.get_board_values(length, start_row, start_coloum, direction)

    # the word can not be placed outside the board
    if board_values == nil
      return nil
    end

    letters.each_with_index do |letter, index|
      letter_position_on_board_value = board_values[index]
      if letter_position_on_board_value == nil # a letter's position on board value is nil
        to_be_placed_tiles << letter
      else
        if letter_position_on_board_value != letter # a letter's position on board value is not as same as the letter
          return nil
        end
      end
    end
    # if all letters in word is already on board, return nil
    if to_be_placed_tiles.size == 0
      return nil
    end
    return to_be_placed_tiles
  end

  def get_board_values(length, start_row, start_coloum, direction)
    board_values = []
    row = start_row
    coloum = start_coloum

    length.times do
      # letter can not be placed outside the board
      if row >= @board.size || coloum >= @board[0].size
        return nil
      end
      # rotate horizontally, coloum + 1
      if direction == :horizontal
        board_value = @board[row][coloum]
        board_values << board_value
        coloum += 1
      # rotate vertically, row + 1
      elsif direction == :vertical
        board_value = @board[row][coloum]
        board_values << board_value
        row += 1
      else
        raise "Direction Error"
      end
    end
    return board_values
  end

  # for test use only. method outside requirement scope
  def place_letter_at(row, coloum, letter)
    @board[row][coloum] = letter
  end

  # Once placed, check if one of the letters in the word is already on board or at least one of the letters is adjacent to a word.
  def word_is_connected(length, to_be_placed_tiles)
    return length > to_be_placed_tiles.size
  end

  def word_is_adjacent(length, start_row, start_coloum, direction)
    # at least one of the letters is adjacent to a word, if adjacent, return true
    row = start_row
    coloum = start_coloum

    length.times do
      # if there is a tile above and it is occupied
      if (row - 1) >= 0 && @board[row - 1][coloum] != nil
        return true
      end
      # below
      if (row + 1) < @board.size && @board[row + 1][coloum] != nil
        return true
      end
      # left
      if (coloum - 1) >= 0 && @board[row][coloum - 1] != nil
        return true
      end
      # right
      if (coloum + 1) < @board.size && @board[row][coloum + 1] != nil
        return true
      end
      if direction == :horizontal
        coloum += 1
      elsif direction == :vertical
        row += 1
      end
    end
    return false
  end

  #check the each tile in to_be_placed_tiles, check if the letter's top-to-bottom and left-to-right(optimize:only need to go through the opposite direction of its original direction) is also a valid word. Unless it is a single letter in that direction, then consider it is a valid letter.

  def is_word_valid(word, start_row, start_coloum, direction) # is valid word means the word can be found in dictionary
    # to_be_placed_tiles

  end

  def get_connected_word(length, start_row, start_coloum, direction)
    row = start_row
    coloum = start_coloum

    length.times do
      # check the tiles above one by one, return the row of the vertically connected word's first letter(row of first nil + 1)
      until row - i > @board.size && @board[row - i][coloum] == nil
        i += 1
        return row + 1
      end

  # 
  #     if (row - 1) >= 0 && @board[row - 1][coloum] == nil
  #       return true
  #     end
  #     # below
  #     if (row + 1) < @board.size && @board[row + 1][coloum] != nil
  #       return true
  #     end
  #     # left
  #     if (coloum - 1) >= 0 && @board[row][coloum - 1] != nil
  #       return true
  #     end
  #     # right
  #     if (coloum + 1) < @board.size && @board[row][coloum + 1] != nil
  #       return true
  #     end
  #     if direction == :horizontal
  #       coloum += 1
  #     elsif direction == :vertical
  #       row += 1
  #     end
  #   end
  #   return false
  # end

end


# Summary for our classroom version/Reason for refactor:
# 1. Should have read through the offical game rule
  # 1.1 a word can be played does not mean word must be able to be placed on all targeted tiles.
    # in another word, two words can be played on top of each other.
    # e.g. player want to play "dog", "o" is played, player can still put "d" and "g", the word can be played.
    # The first check:"every letter of the word's posistion should be empty" is incorrect.
  # 1.2 In order to be played, a word is not necessarily connected to another word. below from wikipedia:
  # "The main word must either use the letters of one or more previously played words or else have at least one of its tiles #horizontally or vertically adjacent to an already played word."
# 2. Should have read through and understand the requirements. Keywords: word(I partially ignored this, instead thinking of handling each "letter". A word should always be considered as a whole.), placed on a given tile, given H/V direction.
# 3. data structure of the board is incorrect: should be Array of arrays; we made an array of arrays of arrays.
#    While our code's logic is still array of array, the tests will mess up.
