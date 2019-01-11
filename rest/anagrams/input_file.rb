require 'csv'
require 'byebug'

class CreateAnagrams
	attr_reader :csv_entry

	def initialize(csv_file)
		@csv_entry = IO.readlines(csv_file)
		@anagram_line = Hash.new{|k, v| k[v]=[]}
	end
	
	def process_list
		# once we have our input csv into an array, order each word and store it as key ina  hash + the values(anagrams)
		@csv_entry.each do |word|
			ordered_alpha = word.chars.sort_by(&:downcase).join 
			@anagram_line[ordered_alpha].push(word).uniq!
			puts '-'*10
			puts @anagram_line.class
			puts @anagram_line
			puts '='*10
		end
		
		#find the longest set of anagrams
		longest_set = @anagram_line.values.sort_by(&:length).last
		
		#puts longest_set.count

		longest_words = @anagram_line.keys.sort_by(&:length).last
		puts @anagram_line[longest_words]
		
		#output the sets of anagrams into a final csv document
		CSV.open("final_data.csv", "wb") do |csv| 
			@anagram_line.each {|k, v| csv << [*v] if v.count > 1 } 
		end
	end
end

 

 

test = CreateAnagrams.new("data_file1.csv")
test.process_list