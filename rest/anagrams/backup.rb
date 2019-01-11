require 'csv'
 
class CreateAnagrams

	def initialize
		@csv_entry = []
		@anagram_line = Hash.new([])
	end
	
	def read_csv_data(data_file)
		CSV.foreach(data_file) do |array|
			@csv_entry << array.first
		end
	end

	def process_list(csv_entry)
		toto = ""
		@csv_entry.each do |word|
			toto = word.chars.sort_by(&:downcase).join # if I kept split before chars, got error "method chars unknown" because applying split on word, I get an array and then I cannot apply method chars on an array because it's a method for string class 
			@csv_entry.each do |row|	
				anagram = row
				row = row.chars.sort_by(&:downcase).join unless row == nil
				if toto == row
					@anagram_line.push ({:toto => anagram})  
				end	 
			end
		end
		CSV.open("final_data.csv", "wb") {|csv| @anagram_line.to_a.each {|elem| csv << elem} }
	end

end



test = CreateAnagrams.new
test.read_csv_data("data_file.csv")
test.process_list(@csv_entry)