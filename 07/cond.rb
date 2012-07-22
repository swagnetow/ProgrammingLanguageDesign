#!/usr/bin/ruby

x = 42
y = 42
month = "February"

# If-then
if x == y then
    puts "x equals y"
end

# If-else
if x == y
    puts "x equals y"
else
    puts "x is not equal to y"
end

# If-elsif-else
if month == "January"
    m = 1
elsif month == "June"
    m = 6
elsif month == "December"
    m = 12
else
    puts "Error"
end

# Unless
unless x == y
    puts "x is not equal to y"
else
    puts "x equals y"
end

# Case
name = case
    when x == 1 then "one"
    when x == 2 then "two"
    when x == 3 then "three"
    else "many"
end

puts name
