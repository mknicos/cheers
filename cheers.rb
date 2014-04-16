puts "What's your name?"
name = gets.chomp.upcase.gsub(/\W+/, '')

while name.empty? || name.count("0-9") > 0
  #force user to input name until they do
  puts "You need to enter a name"
  puts "What's your name?"
  name = gets.chomp.upcase.gsub(/\W+/, '')
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
