#!/usr/bin/ruby

class Array
    def limited?(amin, amax)
        for i in self
            return false if i < amin or amax < i
        end

        return true
    end

    def sorted?()
        inc, dec = 0, 0

        (self.length - 2).downto(0) do |i|
            inc += 1 if self[i] <= self[i + 1]
            dec += 1 if self[i] >= self[i + 1]
        end

        return 1 if inc == self.length - 1
        return -1 if dec == self.length - 1
        return 0
    end
end

array = [4, 8, 15, 16, 23, 42]

puts "array.limited?(0, 2):"
puts array.limited?(0, 2)
puts

puts "array.limited?(4, 42):"
puts array.limited?(4, 42)
puts

puts "array = [4, 8, 15, 16, 23, 42]"
puts "array.sorted?"
puts array.sorted?
puts

array = [4, 15, 16, 23, 42, 8]

puts "array = [4, 15, 16, 23, 42, 8]"
puts "array.sorted?"
puts array.sorted?
puts

array = [42, 23, 16, 15, 8, 4]

puts "array = [42, 23, 16, 15, 8, 4]"
puts "array.sorted?"
puts array.sorted?
puts
