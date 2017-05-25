---
layout: post
title:  "Tutorial For Making a Simple Ruby Number Guessing Game Part 3"
date:   2017-05-24 00:10:45
categories:  tech
comments: true
---

<a href="https://mrpants.io/2017/guessinggame2/"> In the last post</a> we left off with this code:
```ruby
secret_number = rand(1..100)
puts "I have generated a random number for you to guess, what is your guess?"

while secret_number != user_number = gets.chomp.to_i
  puts "That's not the number. #{user_number} is #{user_number > secret_number
  ? 'greater' : 'less'} than the secret number. Try again: "
end

puts "You guessed the right number, You won!!!"
```
It creates a random number, stores it as a `secret_number` variable, then gets a guess from the user, stores it as a `user_number` variable and checks if the two match. If the `user_number` is higher or lower than the `secret_number`, it tells the user. Simple, right? Let's add something else.

Let's go ahead and add our hint feature. What I have in mind is another random number stored as a `divisor` variable that will tell the user if the `secret_number` is divisible by the `divisor`.

Back to the pseudocode:
```ruby
#We need to generate another random number within the loop and store it as a new variable.
#We need to check if that new variable is evenly divisible by the secret_number.
#We need to tell the user if the secret_number is or is not divisible by the new variable.
```
```ruby
secret_number = rand(1..100)
puts "I have generated a random number for you to guess, what is your guess?"

while secret_number != user_number = gets.chomp.to_i
  divisor = rand(2..10)
  puts "That's not the number. #{user_number} is #{user_number > secret_number
  ? 'greater' : 'less'} than the secret number. Try again: "
end

puts "You guessed the right number, You won!!!"
```
So now we have a new `divisor` variable, but that doesn't give us much. I started the random range at 2, because dividing by 1 doesn't tell the user much. We'll go ahead and structure what we do with it as an `if` conditional. Don't forget the `end` after the `if-else`.
```ruby
secret_number = rand(1..100)
puts "I have generated a random number for you to guess, what is your guess?"

while secret_number != user_number = gets.chomp.to_i
  divisor = rand(2..10)
  if secret_number % divisor == 0
    puts "That's not the number.\n#{user_number} is #{user_number >
    secret_number ? 'greater' : 'less'} than the secret number.\nThe secret
    number is divisible by #{divisor}.\nTry again: "
  else
    puts "That's not the number.\n#{user_number} is #{user_number >  
    secret_number ? 'greater' : 'less'} than the secret number.\nThe secret
    number is NOT divisible by #{divisor}.\nTry again: "
  end
end

puts "You guessed the right number, You won!!!"
```
The `%` between `secret_number` and `divisor` is modulo. Modulo divides the first input by the second, and only returns the remainder. So checking if the modulo of `secret_number % divisor == 0` is just asking if they divide evenly. If that returns `true`, the first part of the `if` is triggered. If not, the `else` is triggered. So now we have output after each guess that will tell the user if their number is high/low, and if the `secret_number` is divisible by a random number from 2-10 stored in `divisor`. We also added some new line `\n`s in the code. That just causes a line break at that point, because the output was getting a little jumbled.  
The program is now a little more interesting, as it allows the user to do some thinking that will get them to the number. Triangulation through math. That's fun. In the next post, we're going to do a couple things. We'll implement a counter that decrements with each loop, stops the game after 10 guesses, and gives the user a "cheat" option. It will involve refactoring our loop, and you'll see why.
