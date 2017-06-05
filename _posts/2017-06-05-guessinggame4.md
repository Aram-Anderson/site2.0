---
layout: post
title:  "Tutorial For Making a Simple Ruby Number Guessing Game Part 4"
date:   2017-06-05 00:20:45
categories:  tech
comments: true
---
At the end of the < href="https://mrpants.io/2017/guessinggame3/"> last post</a> here's what was going on:
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

puts "You guessed the right number, it was #{secret_number}! You won!!!"
```
The next tasks, and the last tasks on this project, are to add in a counter that limits the users guesses to 10, and an option to cheat. What I want it to do is offer the option to cheat after 5 wrong guesses. We can use the same counter that limits user guesses to do just that.

Here's the big change on this one. We can't use a `while` loop to do all that for a couple reasons. A `while` loop requires that the conditions which cause it to break be defined at the outset of the loop. In this case, we're going to need 2 different breaks: one if the user guesses the right number, and one if the user runs out of guesses. Since the `while` requires the definition for the break at the outset, we can't give it two different ways to break. The other is that we need to be able to evaluate the `user_number` variable as a string for the cheat function, and as an integer for the rest of the code.

To solve these dilemmas, we can refactor the code into a `loop do` structure. `loop do` does pretty much exactly the same thing as `while`, but we don't need to define what breaks it at the outset, we can do that within the loop. Here's what it looks like:
```ruby
secret_number = rand(1..100)
puts "I have generated a random number for you to guess, what is your guess?"

loop do
  divisor = rand(2..10)
  user_number = gets.chomp.to_i
      break if user_number == secret_number
    if secret_number % divisor == 0
      puts "That's not the number.\n#{user_number} is #{user_number >
      secret_number ? 'greater' : 'less'} than the secret number.\nThe secret number is divisible by #{divisor}.\nTry again: "
    else
      puts "That's not the number.\n#{user_number} is #{user_number >
      secret_number ? 'greater' : 'less'} than the secret number.\nThe secret number is NOT divisible by #{divisor}.\nTry again: "
    end
end

  puts "You guessed the right number, it was #{secret_number}! You won!!!"
```
So that does the same thing as the `while` we had before. The only new part is really the `break if` statement. That part just gives us the condition under which the loop will exit.

Here's some pseudocode to help us break down the next part, which is to add the counter and limit user guesses to 10.
```ruby
#We need to add a counter, which will start at 10 and decrement by 1 each time the loop runs.
#The counter needs to be defined outside the loop, because it would just start over each time the loop runs if were inside.
#We need to add a print statement that lets the user know how many guesses they have remaining.
#We need to add a second condition that breaks the loop if guesses decrement to 0.
```
Creating the counter is easy enough. Just after:
```ruby
secret_number = rand(1..100)
```
We add
```ruby
secret_number = rand(1..100)
counter = 10
```
We need to decrement the counter with each iteration of the loop, and `break if` the `counter == 0`.
```ruby
loop do
  counter -= 1
  break if counter == 0
  divisor = rand(2..10)
  user_number = gets.chomp.to_i
  break if user_number == secret_number
```
That's it. Now the print statement changes to:
```ruby
puts "That's not the number.\n#{user_number} is #{user_number >
secret_number ? 'greater' : 'less'} than the secret number.\nThe secret number is divisible by #{divisor}.\nYou have #{counter} guesses left.\nTry again: "
```
The other print statement is just the same, except that it addresses the `NOT divisible` condition. We now have a `loop do` that decrements the `counter` with each iteration, breaks the loop at 0, and tells the user with each incorrect guess how many guesses they have left. Just one more thing to do, and that's to add the cheat feature.

Here's the pseudocode for that task:
```ruby
#We need to be able to evaluate user_number as a string if the user wants to cheat.
#We need to define the input that will trigger a cheat.
#We need to add a prompt for cheating if the counter is <= 5.
#We need a new prints statement that will give the user the secret_number if they do want to cheat.
```

The input to cheat will need to be evaluated as a string, so we need to remove the `to_i` from the `gets.chomp`.
```ruby
user_number = gets.chomp
```
Now `user_number` is a string by default, which means we need to specify that it is to be evaluated as an integer where we need it to be. That changes the `break if` statement for the `secret_number` comparison:
```ruby
break if user_number.to_i == secret_number
```
and the print statement:
```ruby
puts "That's not the number.\n#{user_number} is #{user_number.to_i >
secret_number ? 'greater' : 'less'} than the secret number.\nThe secret number is divisible by #{divisor}.\nYou have #{counter} guesses left.\nTry again: "
```
We're also going to add an `if` to check whether or not the `counter` is less than or equal to 5, and if so, that will trigger the cheat prompt. The following `if-else` is going to get a third condition, which is the `elsif`. The `if` will check if the user wants to cheat, and the `elsif-else` will do just the same things as the `if-else` do now.
Our whole `if` statement looks like this now:
```ruby
if counter < 6
  puts "If you want to cheat, type 'I'm a big cheater'"
end
  if user_number.to_s.downcase.eql? "i'm a big cheater"
    puts "The secret number is #{number}. Go ahead and type it in, cheater: "
  elsif number % divisor == 0
    puts "The number is #{user_number.to_i > number ? 'less' : 'greater'} than #{user_number}.\nThe number is divisible by #{divisor}!\nYou have #{counter} guesses left.\nTry again: "
  else
    puts "The number is #{user_number.to_i > number ? 'less' : 'greater'} than #{user_number}.\nThe number is NOT divisible by #{divisor}!\nYou have #{counter} guesses left.\nTry again: "
  end
  ```

  That's pretty much it for this one. The program as a whole looks like so:
  ```ruby
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
  end

  if counter > 0
    puts "The number is #{number}! You won!!!"
  else
    puts "You lose! Better luck next time."
  end
```

As I said at the outset of this post, I only vaguely know what I'm doing. I'd be happy to hear from anyone who has ideas to improve on what I was trying to do here. If there's a better path to get to the same functionality, I'm all ears. Feel free to comment with your thoughts. 
