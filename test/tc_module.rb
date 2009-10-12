require "test/unit"

require File.dirname(__FILE__) + "/../lib/euler"

class TestModule < Test::Unit::TestCase
  def test_sieve
    Euler.generate_sieve(50)
    assert_equal(50, Euler::sieve.length, "Euler.sieve(50) should make Euler::sieve an array of length 50.")
    assert(!Euler::sieve[0], "O is not prime.")
    assert(!Euler::sieve[1], "1 is not prime.")
    assert(Euler::sieve[2], "2 is the first prime.")
    assert(Euler::sieve[3], "3 is the second prime.")
    assert(Euler::sieve[29], "29 is the tenth prime.")
    assert(!Euler::sieve[50], "50 is not prime.")
  end

  def test_get_primes
    Euler.get_primes(50)
    assert_equal(50, Euler::primes.length, "Euler.get_primes(50) should make Euler::primes an array of length 50")
    assert_equal(2, Euler::primes[0], "2 is the first prime.")
    assert_equal(29, Euler::primes[9], "29 is the tenth prime.")
  end
  
  def test_get_fibonaccis
    Euler.get_fibonaccis(50)
    assert_equal(2, Euler::fibonaccis[2], "2 is the third fibonaccis number.")
    assert_equal(39088169, Euler::fibonaccis[37], "39088169 is the thirty eighth fibonacci number.")
  end
  
  def test_pythagorean_triplet
    assert(Euler.is_pythagorean_triplet?(3, 4, 5), "3, 4, 5 is the smallest pythagorean triplet.")
    assert(!Euler.is_pythagorean_triplet?(1, 2, 3), "1, 2, 3 is not a pythagorean triplet.")
  end
  
  def test_find_missing_pyth_value
    assert_equal(3, Euler.find_missing_pyth_value(nil, 4, 5))
    assert_equal(4, Euler.find_missing_pyth_value(3, nil, 5))
    assert_equal(5, Euler.find_missing_pyth_value(3, 4, nil))
  end
end
