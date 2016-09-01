# require_relative 'spec_helper'
# require_relative '../lib/Dictionary.rb'#file name(as same as class name)

# describe Scrabble::Dictionary do
# 	it "The dictionary rejects (return false) a word that is not in the dictionary'" do
# 	    expect( Scrabble::Dictionary.in_dictionary?("ZZZZZZ") ).must_equal(false)
# 	 end

# 	it "The dictionary accepts (return true) a word that is in the dictionary'" do
# 	    expect( Scrabble::Dictionary.in_dictionary?("cat") ).must_equal(true)
# 	end

# 	it "The dictionary accepts (return false) a word that is more than 7 letters'" do
# 	    expect( Scrabble::Dictionary.in_dictionary?("encyclopedia") ).must_equal(true)
# 	end

# 	it "The dictionary rejects (return false) a word that has symbols in it'" do
# 	    expect( Scrabble::Dictionary.in_dictionary?("grown-up") ).must_equal(false)
# 	end

# 	it "The dictionary rejects (return false) a word that has contractions'" do
# 	    expect( Scrabble::Dictionary.in_dictionary?("doesn't") ).must_equal(false)
# 	end

# 	it "The dictionary rejects (return false) a word that has numbers in it'" do
# 	    expect( Scrabble::Dictionary.in_dictionary?("1piece") ).must_equal(false)
# 	end

# 	it "The dictionary rejects (return false) a phrase that has spaces in it'" do
# 	    expect( Scrabble::Dictionary.in_dictionary?("grown up") ).must_equal(false)
# 	end
# end
