---
layout: post
title:  "Tutorial For Making a Simple Ruby Number Guessing Game Part 2"
date:   2017-05-24 00:10:45
categories:  tech
comments: true
---

<a href="_posts/2017-05-24-guessinggame1.md">So last time</a> we ended up with a really simple <code>while</code> loop based guessing game. It looks like this:
```ruby
secret_number = rand(1..100)
puts "I have generated a random number for you to guess, what is your guess?"

while secret_number != user_number = gets.chomp.to_i
  puts "That's not the number. Try again: "
end

puts "You guessed the right number, You won!!!"
```
Pretty dull, right? Let's make it a little more interesting.

Let's give it the ability to tell the user if their guess was higher or lower than the secret number. Let's pseudocode that problem.
```ruby
#We need to compare the variables to see if the user_number variable is higher or lower than the secret_number variable.
```
That sounds like an <code>if</code> statement to me. An <code>if</code> is just what it sounds like. If this thing, do this. If not this thing, do that.
That probably looks something like this:
```ruby
secret_number = rand(1..100)
puts "I have generated a random number for you to guess, what is your guess?"

while secret_number != user_number = gets.chomp.to_i
  if user_number > secret_number
    puts "That's not the number. #{user_number} is greater than the secret number. Try again: "
  else
    puts "That's not the number. #{user_number} is less than the secret number. Try again: "
end

puts "You guessed the right number, You won!!!"
```
The first part of the `if` just says: "is the user number more than the secret number? If so, do this." The `else` says: "if that first part isn't true, do this." Since the number is either greater or less, that's all we need. The other thing I jammed in there is string interpolation. That's that part that looks like `#{stuff}`. That's just a way to inject some ruby code into a string without leaving the string. It just says: "whatever is inside those curly braces, evaluate that as code, and add the result to that part of the string." So it just jams whatever is stored in the `user_number` variable into that spot.

There is a more condensed way to do the very same thing. I'll just put the code here, I bet you can figure out how it works. Just think about how the `if` above works, and know there is a comparable part to everything in that one.
```ruby
secret_number = rand(1..100)
puts "I have generated a random number for you to guess, what is your guess?"

while secret_number != user_number = gets.chomp.to_i
  puts "That's not the number. #{user_number} is #{user_number > secret_number ? 'greater' : 'less'} than the secret number. Try again: "
end

puts "You guessed the right number, You won!!!"
```
So now we have a game that gives the user some feedback that depends on what they put in. That's a little cooler, right? Next post we'll give it a math based hint.
