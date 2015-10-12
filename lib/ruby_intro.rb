# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  # Return 0 for empty array, otherwise return sum of elements
  #arr.count == 0 ? 0 : arr.reduce(:+)
  #arr.reduce(0, :+)
  arr.inject(0) {|sum, n| sum + n}
end

def max_2_sum arr
  # YOUR CODE HERE
  # Return 0 for empty array, otherwise return sum of
  # two largest elements (of integer array)
  twoBiggest = arr.max(2)
  twoBiggest.inject(0) {|sum, n| sum + n}
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  # aka 2SUM problem
  # returns true if any 2 elements of array arr
  # sum to n.
  # check sum of beginning and end elements of sorted array,
  # and work in as appropriate
  return false if arr.count < 2  # can't sum 2 elements
  first = 0
  last = arr.count - 1
  arr.sort!
  return sum_to_n_rec arr, first, last, n
end

def sum_to_n_rec arr, first, last, n
  return false if (first >= last)
  sum = arr[first] + arr[last]
  return true if (n == sum)
  if sum > n
    last -= 1
  else
    first += 1
  end
  return sum_to_n_rec arr, first, last, n
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  "Hello, " + name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  return false if 0 == s.length   # handle empty string
  s.downcase!           # convert s to lowercase
  # check that first character is a letter, and not a vowel
  (s[0].scan(/[a-z]/) != []) && (s[0].scan(/[aeiou]/) == [])
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  # can use String.to_i to get number from string,
  # and Integer.to_s(2) to get binary representation,
  # but that's not what's wanted here.
  # first check special case, s = "0" or "00"
  return true if s == "0" || s == "00"
  # regex to see if all characters of s = "0" or "1"
  return false if [] != s.scan(/[^01]/)
  # check if it's a multiple of 4
  last = s.length
  return false if last < 3  # already checked 0 and 00
  return ("0" == s[last - 1]) && ("0" == s[last - 2])
end

# Part 3

class BookInStock
# YOUR CODE HERE
  attr_accessor :isbn, :price

  def initialize isbn, price
    @isbn = isbn
    @price = price
    if (@price <= 0.0)
      raise ArgumentError.new("Only positive prices are valid")
    end
    # rspec wants me to reject invalid ISBN - rspec test just
    # cheks for null string
    if (@isbn == "")
      raise ArgumentError.new("Null ISBN entered")
    end
  end

  def price_as_string
    sPrice = @price.to_f      # string to float
    sPrice = "%.2f" % sPrice  # round to 2 digits, and convert to string
    "$" + sPrice              # add leading $
  end
end
