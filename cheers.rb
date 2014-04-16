puts "What's you name?"
name = gets.chomp.upcase

puts "Your name is: " + name
name.each_char do |character|
  if character == "A" || character == "I" || character == "E" || character == "O" || character == "U"
    puts "Give me an... " + character
  else
    puts "Give me a ... " + character
  end
end
puts name + "'s just GRAND!"
