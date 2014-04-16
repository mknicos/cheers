require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "BRT"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Your name is: BRT
Give me a ... B
Give me a ... R
Give me a ... T
BRT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_all_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "AEI"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Your name is: AEI
Give me an... A
Give me an... E
Give me an... I
AEI's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_vowels_and_consonants
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "MATT"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Your name is: MATT
Give me a ... M
Give me an... A
Give me a ... T
Give me a ... T
MATT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_all_lowercase
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "matt"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Your name is: MATT
Give me a ... M
Give me an... A
Give me a ... T
Give me a ... T
MATT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_an_initial_empty_user_input
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts ""
      pipe.puts "Matt"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
You need to enter a name
What's your name?
Your name is: MATT
Give me a ... M
Give me an... A
Give me a ... T
Give me a ... T
MATT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_repeated_empty_user_input
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts ""
      pipe.puts ""
      pipe.puts ""
      pipe.puts "Matt"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
You need to enter a name
What's your name?
You need to enter a name
What's your name?
You need to enter a name
What's your name?
Your name is: MATT
Give me a ... M
Give me an... A
Give me a ... T
Give me a ... T
MATT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end


  def test_name_with_symbols_and_spaces
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "@#ma$%tt *&"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Your name is: MATT
Give me a ... M
Give me an... A
Give me a ... T
Give me a ... T
MATT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_name_with_numbers
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "ma34tt"
      pipe.puts "2222"
      pipe.puts "matt"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
You need to enter a name
What's your name?
You need to enter a name
What's your name?
Your name is: MATT
Give me a ... M
Give me an... A
Give me a ... T
Give me a ... T
MATT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end
end
