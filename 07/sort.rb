#!/usr/bin/ruby

# Selection sort
def sort(v)
    arr = []
    for j in 1 .. (v.length - 1)
        key = v[j]
        i = j - 1
        while i >= 0 and v[i] > key
            arr[i+1] = v[i]
            i = i - 1
        end
        arr[i+1] = key
    end
    return arr
end

v = [8, 4, 16, 15, 42, 23]

sorted = sort(v)

puts "Initial array: "
puts v
puts
puts "New sorted array: "
puts sorted
