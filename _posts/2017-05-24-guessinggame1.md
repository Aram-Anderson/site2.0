---
layout: post
title:  "Tutorial For Making a Simple Ruby Number Guessing Game Part 1"
date:   2017-05-24 00:10:45
categories:  tech
comments: true
---

As part of the gear up for Turing, they send out a prework package. It's basically just a set of exercises and resources that cover the basics of ruby, as well as general logical thinking, and some materials on how to be successful in the program, and as a dev afterword. It's good stuff, and I've been spending a lot of time with my nose deep in the material.

Just FYI, I'm going to be writing this for the total beginner, meaning me. I don't think more than like 5 people will ever read this anyway, so it's as much a sounding board to work out my own thoughts as anything else. I'm a beginner, so I may not do everything the best/easiest way I could have. If you have any suggestions on how I could improve what I do here, I'd be happy to hear them in the comments.

One of the exercises in the Turing prework package is to have the student build a simple number guessing game that runs in the command line. The specs are that it generate a random number between 1-100, then asks the user for a number. If the numbers match, the program prints "You won!!!"(or something like that), and exits. If guess is wrong, the program prints "Try again:" and takes in another guess.

There are a number of optional extensions in the challenge. You can add in functionality for the program to tell you if your guess was high or low, add in the ability to cheat by entering "cheat"(or whatever string you decide on), and implementing some kind of mathematical hint. I also added in a limit of 10 guesses with the program telling the user each turn how many guesses they have left. If the user runs out of guesses, the program ends and gives a "You lost" message. I will be going over each of those in future posts. This one is just basic functionality.

So let's start by pseudocoding the problem:
```ruby
#We need to generate a random number, and assign that number to a variable.
#We need a prompt to start the game, which will tell the user what the game is and ask for input.
#We need to get a number from the user, and assign that number to a variable.
#We need to compare those numbers, and see if they match.
#If they do, we take one fork, if they don't, we take another.
```

Let's take each of those steps and see if we can get some code in ruby that does those things:
```ruby
#We need to generate a random number, and assign that number to a variable.
secret_number = rand(1..100)
```
That line will assign a random number between 1 and 100 to the variable <code>secret_number</code>. The <code>rand</code> part of that accesses ruby's PRNG (pseudo-random number generator), which, according to <a href="https://ruby-doc.org/core-2.2.0/Random.html#method-i-rand">ruby-doc.org</a>, "...produces a deterministic sequence of bits which approximate true randomness. The sequence may be represented by integers, floats, or binary strings." That's probably way more complex than I need to worry about here, but I like to have some idea of how things are working. The (1..100) gives a range from which the random number be selected. There are three (or likely more) ways to do that. I did (1..100), which is an inclusive selection, meaning 1 and 100 are possible numbers. It can also be done with (1...100), which will exclude 1 and 100 as possibilities. You could also do <code>rand(100)</code>, which will select any number up to 100. I didn't want that, because 0 is included in that selection. I didn't want 0, because it would make my math hints down the road kind of useless if 0 turned out to be the number.

Now, lets look at the next task:
```ruby
#We need a prompt to start the game, which will tell the user what the game is and ask for input.
puts "I have generated a random number for you to guess, what is your guess?"
```
This bit of code is really straight forward. <code>puts</code> just prints to the console, and it's followed by a string that will be printed.

The next part is a little more complicated. This is where the program will really do what it is supposed to do. We're going to structure this using a <code>while</code> loop. A while loop will just keep looping on itself until a specified condition is met, which will cause the program to break out of the loop and move to the next part of the program. Here's what I came up with, and it covers the next two parts of the pseudocoding we did earlier.
```ruby
#We need to get a number from the user, and assign that number to a variable.
#We need to compare those numbers, and see if they match.
while secret_number != user_number = gets.chomp.to_i
  puts "That's not the number. Try again: "
end
```
We are asking for the user input and assigning to the variable, and making the comparison to the other variable at the same time. We have to do it all at once because that will allow the user to type something different each time the loop repeats, and check for parity again. What that loop will do is take input from the user, assign it to the variable <code>user_number</code>, and compare that to <code>secret_number</code>. The != boolean operator will return true if the compared variables are not the same, and trigger the internal <code>puts</code> within the loop. The loop then bounces back to the top and starts over with some new user input. The <code>.chomp</code> bit removes the carriage return that would otherwise there from the user pressing enter after they input their response. Again, probably don't need to worry about the meachanics, but I like to know how stuff works. The <code>to_i</code> part takes the user input and turns it into an integer. <code>gets</code> takes in a string by default, and that won't be very helpful if we're comparing that to an integer. <code>to_i</code> solves that.

All that's left is to is create the message that will be displayed if <code>!=</code> returns false. If false (meaning the variables match) is the result, the loop goes to the <code>end</code> below the <code>puts</code>. That breaks the loop, and the program moves to whatever code is after the loop. In this case, that means the <code>user_number</code> and <code>secret_number</code> match, and the user won.
```ruby
#If they do, we take one fork, if they don't, we take another.
puts "You guess the right number, You won!!!"
```
So all together, this is our program:

```ruby
secret_number = rand(1..100)
puts "I have generated a random number for you to guess, what is your guess?"

while secret_number != user_number = gets.chomp.to_i
  puts "That's not the number. Try again: "
end

puts "You guessed the right number, You won!!!"
```
That is certainly not a very exciting game, but it works, and it's a functioning while loop, so that's something. The next post will be adding some features to this game, and making a little more interesting.
