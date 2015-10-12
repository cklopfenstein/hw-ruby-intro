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

#recursive version
def sum_to_n? arr, n
  # YOUR CODE HERE
  # aka 2SUM problem
  # returns true if any 2 elements of array arr
  # sum to n.
  # check sum of beginning and end elements of sorted array,
  # and work in as appropriate
  arr.sort!
  return sum_to_n_rec? arr, n
end

def sum_to_n_rec? arr, n
  len = arr.count
  return false if (len < 2)     # don't have 2 elements to sum
  first = 0
  last = len - 1
  sum = arr[first] + arr[last]
  return true if (n == sum)     # found match
  if sum > n
    last -= 1                   # bigger - discard largest element
  else
    first += 1                  # smaller - discard smallest element
  end
  return sum_to_n_rec? arr[first .. last], n   # and try again
end

# # iterative version
# def sum_to_n? arr, n
#   # aka 2SUM problem
#   # returns true if any 2 elements of array arr
#   # sum to n.
#   # check sum of beginning and end elements of sorted array,
#   # and work in as appropriate
#   return false if arr.count < 2  # don't have 2 elements to sum
#   arr.sort!
#   first = 0
#   last = arr.count - 1
#   while (first < last)
#     sum = arr[first] + arr[last]
#     return true if (sum == n)
#     if sum > n
#       last -= 1
#     else
#       first += 1
#     end # if block
#   end   # while loop
#   return false  # here if no match
# end
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
  len = s.length
  return false if len < 3  # already checked 0 and 00
  return ("0" == s[len - 1]) && ("0" == s[len - 2])
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
