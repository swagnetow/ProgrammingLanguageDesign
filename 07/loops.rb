#!/usr/bin/ruby

# Loop do
puts "Loop do:"

i = 0

loop do
    i += 1
    next if i > 3 && i < 7
    break if i > 10
    puts i
end

puts

x = 0.5

# While loop
puts "While loop:"

while x <= 3 do
    puts "#{x}  #{x*x}"
    x += 0.5
end

puts

x = 0.5

# Until loop
puts "Until loop:"

until x > 3 do
    puts "#{x}  #{x*x}"
    x += 0.5
end

puts

# While-until loop
array = [1,2,3,4]

puts "While-until loop:"

i = 0

begin
    puts array[i]
    i += 1
end until i > 3

puts


# For-in loop
array = [1,2,3,4]

puts "For-in loop:"

for component in array
    puts component
end

puts

# Iterator upto
k = 1

puts "Iterator upto:"

(k + 1).upto(k + 3) {|n| puts n}

puts

# Iterator downto
k = 0

puts "Iterator downto:"

100.downto(1) {|n| k=k+n}

puts "\n1+2+...+100 = #{k}"; puts

puts

# Times (implicit)
puts "Times (implicit):"

3.times {puts "Thanks!"}

puts

# Times (explicit)
puts "Times (explicit):"

6.times {|n| print n, ' '}; puts

puts

# Each
puts "Each loop:"

(-5 .. 5).each do
    |x| print x, ' '
end

puts
puts

# Each with index
puts "Each with index: "

# TextFile.txt:
# 1
# 2
# 3
# 4

File.open("TextFile.txt") do |f|
    f.each_with_index do |line, number|
        print "line #{number}: #{line}"
    end
end

puts

# Map
sum = 0

puts "Map loop:"

(1 .. 20000).map {|x| sum = sum + 1.0/(x*(x+1))}

puts sum; puts

# Step
puts "Step loop:"

0.step(3, 0.4) do |x|
    puts "#{x}  #{Math.sin(x)}"
end
