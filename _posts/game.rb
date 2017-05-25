secret_number = rand(1..100)
puts "I have generated a random number for you to guess, what is your guess?"

while secret_number != user_number = gets.chomp.to_i
  divisor = rand(2..10)
  if secret_number % divisor == 0
    puts "That's not the number.\n#{user_number} is #{user_number > secret_number ? 'greater' : 'less'} than the secret number.\nThe secret number is divisible by #{divisor}.\nTry again: "
  else
    puts "That's not the number.\n#{user_number} is #{user_number > secret_number ? 'greater' : 'less'} than the secret number.\nThe secret number is NOT divisible by #{divisor}.\nTry again: "
  end
end

puts "You guessed the right number, You won!!!"
