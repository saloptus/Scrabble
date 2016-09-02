require 'csv'

regex=/[\W\d\_]/ 
clean_word_list=CSV.open('clean_word_list.csv',"w")

CSV.foreach('raw_word_list.csv') do |row|
	#This is to prevent the CSV file from reading a " (quotation mark) next to a space
	#for some reason the program crashes if this occurs
	if (row[0]=~/[\"]/) != nil
		row[0].gsub(/,\s+\"/,',\"')
	end

	#If the word doesn't include anything in our regex then write that row to the new csv
	if (row[0]=~regex)==nil
		clean_word_list<<row
	end
end

#To check if any non-word character are left
CSV.foreach('clean_word_list.csv') do |row|
	if (row[0]=~regex)!=nil
		puts "There are special characters"
	end
end
puts "There are no special characters"