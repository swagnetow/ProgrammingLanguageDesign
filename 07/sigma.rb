#!/usr/bin/ruby

def mean_sigma(v)
    sum = 0

    for i in v
        sum += i
    end

    mean = sum/v.size

    sum = 0

    for i in v
        sum += (i - mean)**2
    end

    variance = sum/v.size
    std_dev = Math.sqrt(variance)

    return mean, std_dev
end

v = [1,3,5,7,9]

mu, sigma = mean_sigma(v)

print "Mean: ", mu, "\n"
print "Standard Deviation: ", sigma, "\n"
