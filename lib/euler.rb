# The module that contains all the methods.
module Euler
  VERSION = "1.0.4"
  extend self
  attr_reader :primes, :sieve, :fibonaccis
  # Several methods for the Integer class.
  module IntegerMethods
    # Returns +self+!
    #   5.factorial # => 120
    def factorial
      return 0 if self < 1
      (2..self).inject(1) { |value, n| value * n }
    end
  
    # Returns an array of prime factors of +self+
    #   10.prime_factors # => [2, 5]
    #   20.prime_factors # => [2, 2, 5]
    def prime_factors
      return [self] if self.prime?
      current, to_factor, factors, max = 2, self, [], 0
      # current is the value currently being tested to_factor is the value
      # being factored (slowly moves to a prime value) factors is the array of
      # prime factors max is the maximum value of any factor set after the
      # next loop
      while to_factor % current == 0
        factors << 2
        to_factor /= current
      end
      current += 1
      max = Math.sqrt(to_factor).to_i + 1
      while to_factor <= max
        if to_factor % current == 0
          factors << current
          to_factor /= current
        else
          i += 2
        end
      end
      factors << to_factor if to_factor > 1
      return factors
    end
  
    # Returns a boolean which gives the primality of +self+
    #   2.prime? # => true
    #   4.prime? # => false
    def prime?
      if    self == 1     then return false
      elsif self < 4      then return true
      elsif self % 2 == 0 then return false
      elsif self < 9      then return true
      elsif self % 3 == 0 then return false
      else
        5.step(Math.sqrt(self).to_i, 2) do |x|
          return false if self % x == 0
        end
      end
      return true
    end
  
    # Compares +self+ and +x+ and returns +true+ if the values are 
    # permutations, and +false+ otherwise.
    #   123.is_permutation?(312) # => true
    #   312.is_permutation?(281) # => false
    def is_permutation?(x)
      return true if self == x # A number is a permutation of itself
      primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      s, s_total, x_total = self, 1, 1
      
      while s > 0
        s_total *= primes[s % 10]
        s /= 10
      end
      
      while x > 0
        x_total *= primes[x % 10]
        x /= 10
      end
      
      return s_total == x_total
    end
  
    # Checks to see if +self+ is a pandigital with the range of x
    #   0192837465.is_pandigital?(0..9) # => true
    #   0192837465.is_pandigital?(1..9) # => false
    def is_pandigital?(x)
      str = self.to_s
      x.each do |i|
        return false unless str.include? i.to_s
      end
      return true
    end
  
    # Checks to see if +self+ is contained in the fibonacci sequence.
    #   1.is_fibonacci? # => true
    #   4.is_fibonacci? # => true
    def is_fibonacci?
      a, b = Math.sqrt((5*(self**2))+4), Math.sqrt((5*(self**2))-4)
      return true if (a.to_i == a and b.to_i != b) or (a.to_i != a && b.to_i == b)
      return false
    end
    
    # Returns how many digits +self+ contains.
    #   10.length   # => 2
    #   4563.length # => 4
    def length
      n, count = self, 1
      while n > 9
        n /= 10
        count += 1
      end
      return count
    end
  end

  # A basic prime sieve. Sets Euler.sieve to an array of boolean values that
  # indicate if that index if prime or not.
  #   Euler.generate_sieve(50)
  #   Euler::sieve[2] # => true
  #   Euler::sieve[4] # => false
  def generate_sieve(max)
    @sieve = Array.new(max, false)
    @sieve[2] = true
    3.step(max, 2) { |x| @sieve[x] = true}
    3.step(Math.sqrt(max).to_i, 2) { |i|
      if @sieve[i]
        (i**2).step(max, 2*i) { |x| @sieve[x] = false}
      end
    }
  end

  # A more advanced prime sieve. Generates an n amount of prime values.
  #   Euler.get_primes(50)
  #   Euler::primes[0] # => 2
  #   Euler::primes[2] # => 5
  def get_primes(n)
    counter, current_value, @primes = 0, 2, []
    while counter < n
      if current_value.prime?
        @primes << current_value 
        counter += 1
      end
      current_value += 1
    end
  end

  # Sets Euler::fibonaccis to an array of integers which are the
  # Fibonacci sequence of length +n+
  #   Euler.get_fibonaccis(50)
  #   Euler::fibonaccis[0] # => 1
  #   Euler::fibonaccis[4] # => 5
  def get_fibonaccis(n)
    @fibonaccis, phi = [], (1+Math.sqrt(5))/2
    sqrt_5 = Math.sqrt(5)
    0.upto(n) do |x|
      @fibonaccis << (phi**(x+1)/sqrt_5).round
    end
  end
  
  # Determines if the three values given are a pythagorean triplet
  #   Euler.is_pythagorean_triplet?(3, 4, 5) # => true
  #   Euler.is_pythagorean_triplet?(1, 2, 3) # => false
  def is_pythagorean_triplet?(a, b, c)
    a**2 + b**2 == c**2
  end
  
  # Given two values of a pythagorean triplet, and nil for the missing value,
  # it returns the missing value.
  #   Euler.find_missing_pyth_value(nil, 4, 5) # => 3
  def find_missing_pyth_value(a, b, c)
    return Math.sqrt(c**2 - b**2) if a.nil?
    return Math.sqrt(c**2 - a**2) if b.nil?
    return Math.sqrt(a**2 + b**2) if c.nil?
  end
  
end

# Just adds Euler::IntegerMethods to the Integer class.
Integer.send :include, Euler::IntegerMethods