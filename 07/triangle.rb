#!/usr/bin/ruby

class Triangle
    def initialize(x, y, z)
        @base = x
        @height = y
        @hypotenuse = z
    end

    def perimeter()
        return @base + @height + @hypotenuse
    end

    def area()
        return 0.5 * @base * @height
    end

    def test()
        if (@base + @height) > @hypotenuse
            puts "Is a triangle"
            print "Perimeter: ", perimeter(), "\n"
        else
            puts "Not a triangle"
            return
        end

        if @base == @height and @height == @hypotenuse and @base == @hypotenuse
            puts "Equilateral"
        else
            puts "Not Equilateral"
        end

        if @base == @height or @height == @hypotenuse or @base == @hypotenuse
            puts "Isosceles"
        else
            puts "Not Isosceles"
        end

        if @base != @height and @height != @hypotenuse and @base != @hypotenuse
            puts "Scalene"
        else
            puts "Not Scalene"
        end

        if (@base * @base) + (@height * @height) == (@hypotenuse * @hypotenuse)
            puts "Right"
        else
            puts "Not right"
        end
    end
end

a = Triangle.new(2, 2, 5)
puts "Triangle a: "
a.test

puts

b = Triangle.new(3, 4, 5)
puts "Triangle b: "
b.test

puts

c = Triangle.new(3, 3, 3)
puts "Triangle c: "
c.test

puts

d = Triangle.new(2, 2, 3)
puts "Triangle d: "
d.test
