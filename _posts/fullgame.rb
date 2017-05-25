number = rand(1..100)
puts "I have generated a random number for you to guess, what is your guess?"
counter = 10

loop do
  break if counter == 0
  divisor = rand(2..10)
  user_number = gets.chomp
      break if user_number.to_i == number
  counter -= 1
  if counter < 6
    puts "If you want to cheat, type 'I'm a big cheater'"
  end
    if user_number.to_s.downcase.eql? "i'm a big cheater"
      puts "The secret number is #{number}. Go ahead and type it in, cheater: "
    elsif number % divisor == 0
      puts "The number is #{user_number.to_i > number ? 'less' : 'greater'} than #{user_number}.\nThe number is divisable by #{divisor}!\nYou have #{counter} guesses left.\nTry again: "
    else
      puts "The number is #{user_number.to_i > number ? 'less' : 'greater'} than #{user_number}.\nThe number is NOT divisable by #{divisor}!\nYou have #{counter} guesses left.\nTry again: "
end
  break if user_number.to_i == number
end

if counter > 0
  puts "The number is #{number}! You won!!!"
else
  puts "You lose! Better luck next time."
end
