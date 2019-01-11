    dial_book = {
        "ny" => "125",
        "boston" => "466",
        "dallas" => "147", 
        "london" => "128",
        "santafe" => "258",
        "kings" => "789",
        "chicago" => "369",
        "paris" => "147",
        "reims" => "569",
        "troie" => "145",
		}

		def get_city_names(somehash)
			somehash.each {|k, v| puts k}
		end

		def get_area_code(somehash, key)
			somehash[key]
		end

		loop do
			puts "Do you want to lookup a city name(Y/N)?"

			answer = gets.chomp
			if answer != "Y"
				break
			end

			puts "Which city do you want the code area for?"

			get_city_names(dial_book)
			puts "Enter your selection"
			prompt = gets.chomp

			if dial_book.include?(prompt)
				puts "The code for the city you selected is #{get_area_code(dial_book, prompt)}"
			else
				puts "The city you input is not in the database"
			end
		end
