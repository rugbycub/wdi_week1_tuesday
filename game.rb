pages_with_questions = {}
lines_grabbed = ""
key = ""
response = nil
ending = nil

File.open("story.txt", "r") do |infile|
	while (line = infile.gets)
		if line.index("~p")
			key = line
			lines_grabbed = ""
		else
			lines_grabbed += line
		end
		pages_with_questions[key] = lines_grabbed 
	end
end


p1 = pages_with_questions.select {|k,v| k.index "~p01"}
p2 = pages_with_questions.select {|k,v| k.index "~p02"}
p3 = pages_with_questions.select {|k,v| k.index "~p03"}
p4 = pages_with_questions.select {|k,v| k.index "~p04"}
p5 = pages_with_questions.select {|k,v| k.index "~p05"}
p6 = pages_with_questions.select {|k,v| k.index "~p06"}
p7 = pages_with_questions.select {|k,v| k.index "~p07"}
p8 = pages_with_questions.select {|k,v| k.index "~p08"}
p9 = pages_with_questions.select {|k,v| k.index "~p09"}

p1.each {|key, value| puts value}
	
while ending == nil

#gordon
  puts "Do you want to use gordon's recipe?"
  response = gets.chomp.downcase

    if response == "yes" 
      ending = "awesome"
	  break
	else 
	  puts "Ok. That's fine."
	end

#own recipe
  puts "Do you want to use your own recipe"
  response = gets.strip.downcase
    if response == "yes" 
	  ending == "hungry"
	  break
	else 
	  puts "Ok. That's fine too."
	end

	#call someone
  puts "Do you want to call someone?"
  response = gets.strip.downcase
    if response == "yes"
	  response = nil
	  p2.each {|key, value| puts value}
	  #call mom
	  puts "do you want to call your mother?"
	  response = gets.strip.downcase
	    if response == "yes"
		  p4.each {|key, value| puts value}
          response = nil
          puts "do you want to try another option?"
		  response = gets.chomp.downcase
		    if response == "yes"
			  redo
			else
			  response = "quit"
			  ending = "lame"
			  break	
			end
		else
			puts "How about another option"
		end
	#call friend
	  puts "do you want to call your friend?"
	  response = gets.strip.downcase
	  if response == "yes"
	  	p5.each {|key, value| puts value}
	  	response = nil
	  	puts "do you want to try another option?"
	  	response = gets.chomp.downcase
	  	if response == "yes"
	  		redo
	  	else
	  		response = "quit"
				ending = "lame"
				break
			end
		end	
	else 
		puts "Ok. That's fine too."
	end

	puts "Do you want to look online?"
	response = gets.strip.downcase
	if response == "yes"
		response = nil
		p3.each {|key, value| puts value}

		puts "do you want to look at the food network?"
		response = gets.strip.downcase
		if response == "yes"
			p6.each {|key, value| puts value}
			response = nil
			
			puts "Should we check Ina Garten's Recipes?"
			response = gets.strip.downcase
			if response == "yes"
				p8.each {|key, value| puts value}
				response = "quit"
				ending = "awesome"
				break	
			else
				puts "lets try something else"
				response = nil
			end
			puts "How abot Sandra Lee?"
			response = gets.strip.downcase
			if response == "yes"
				p9.each {|key, value| puts value}
				response = "quit"
				ending = "lame"
				break
			else
				puts "Lets try this again"
				redo
			end
		else
			puts "How about another option"
		end
		puts "do you want to try googling it?"
		response = gets.strip
		if response == "yes"
			p7.each {|key, value| puts value}
			response = nil
			ending = "hungry"
		else
			redo
		end
	else
		puts "I'm not really sure what you want to do."
		puts "let's try this again"
	end
end
		

if ending == "awesome"
	puts "You are full and ready for the day."
elsif ending == "lame"
	puts "You spent $15 on a lame breakfast at the café"
	puts "because you had no time to cook."
	puts "fail"
else
	puts "You are not hungry this morning, "
	puts "but your taste buds are crying for better."
	puts "fail"
end
