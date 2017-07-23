---
layout: post
title:  "Reversing a Number In Ruby Without Converting To A String"
date:   2017-07-22 00:07:45
categories:  ruby, algorithms
comments: true
---

Offhand, I can't think of when I needed to reverse a number, but I know there's been an occasion or two. With a dynamically typed language like ruby, it's easy to simply convert the number to a string class object and use the built in `.reverse` method. I probably did that when it came up, and thought nothing of it.

At school yesterday, I had a chance to meet with one of my mentors, and he brought up the inefficiency of the integer to string solution to this problem. He implied that solving this mathematically is a far better way to do it from an efficiency standpoint. It was just an offhand comment in the course of a larger conversation, but it made me think about the problem, and I wanted to learn what the better solution might be.

If we define a ruby method to solve this the int to string to int way, it would look something like this:

```ruby
def reverse_as_string(num)
  num.to_s.reverse.to_i
end
```
That's pretty simple. Let's do it the other way.

```ruby
def reverse_num(num)
 reversed = 0
 until num == 0
   last_digit = num % 10
   reversed = (reversed * 10) + last_digit
   num = num / 10
 end
 reversed
end
```

Let's break that down:

```ruby
def reverse_num(num)
 reversed = 0
#reversed will start at 0, and will end up being the reversed number
 ```
 ```ruby
  until num == 0
#we will loop until the original input is 0, because each cycle of the loop in effect removes the trailing digit from the original number.
```
```ruby
    last_digit = num % 10
#Here we get the last digit of the input number through use of the modulo method in ruby. When we input a number (ie 987) all columns of that number except the 1s column are evenly divisible by ten, so the output of the modulo operation will be the last number since the 1s column will not divide by 10 evenly. If the 1s column is a 0, it still works because of the next step always started by a adding a 0.
```

```ruby
   reversed = (reversed * 10) + last_digit
#Here we're basically building the new number. Multiplying the reversed variable by 10 will give us another column on the number which will be 0 by default, and then we add the result of the previous modulo operation to that column. As an example, if last_digit = 9, and reversed = 78, the line above will do reversed * 10 (= 780), then add last_digit (780 + 9 = 789).
```
```ruby
    num = num / 10
#The last thing we need to do is remove the trailing digit from out original input. Here we take advantage of the way ruby does division on integers by default, which is to always round down to the nearest whole number. In effect, whenever you divide by 10 in ruby, it's just going to remove the last digit, because it will round down.
```
The end condition of the loop is met once the final digit has been removed from the original input, the loop breaks, and we call an implicit return of `reversed`, which is now the full reversed number. Pretty neat.

That's all well and good, but what was interesting about this problem in the first place was efficiency. How do these two approaches stack up?

Let's benchmark them side by side.

```ruby
array = Array.new(10000000) { rand 1..10000000 }

Benchmark.bmbm do |x|
x.report("string:")   { array.each { |i| reverse_as_string(i) } }
x.report("math:") { array.each { |i| reverse_num(i) } }
end
```

```ruby
Rehearsal -------------------------------------------
string:   3.910000   0.050000   3.960000 (  4.020166)
math:     5.990000   0.070000   6.060000 (  6.154384)
--------------------------------- total: 10.020000sec

              user     system      total        real
string:   3.890000   0.050000   3.940000 (  4.001591)
math:     5.700000   0.070000   5.770000 (  5.852306)
```

That was not what I expected! The `to_s` approach actually outperformed the mathematical approach by about 150%. I will certainly concede that I'm very likely missing a more efficient way to do this mathematically, and if you have some ideas, leave me a comment. I'd be happy to rerun benchmarks and update this post with better solutions.
