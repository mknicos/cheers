puts "What's your name?"
name = gets.chomp.upcase

if name.empty?
  puts "You need to enter a name"
  raise ArgumentError
end
puts "Your name is: " + name
name.each_char do |character|
  if character == "A" || character == "I" || character == "E" || character == "O" || character == "U"
    puts "Give me an... " + character
  else
    puts "Give me a ... " + character
  end
end
puts name + "'s just GRAND!"
