require "test/unit"

require "euler"

class TestIntegerMethods < Test::Unit::TestCase
  def test_factorial
    assert_equal(0, 0.factorial, "0! == 0")
    assert_equal(1, 1.factorial, "1! == 1")
    assert_equal(120, 5.factorial, "5! == 120")
  end
  
  def test_prime_factors
    assert_equal([2, 5], 10.prime_factors, "10 factors into 2 and 5.")
    assert_equal([2, 2, 5], 20.prime_factors, "20 factors into 2, 2, and 5.")
  end
  
  def test_primality
    assert(!1.prime?, "1 is not a prime.")
    assert(2.prime?, "2 is the first prime.")
    assert(3.prime?, "3 is the second prime.")
    assert(29.prime?, "29 is the tenth prime.")
    assert(!77.prime?, "77 is not a prime.")
  end
  
  def test_permutations
    assert(132.is_permutation?(123), "132 is a permutation of 123.")
    assert(!3344.is_permutation?(3444), "3344 is not a permutation of 3444.")
  end
  
  def test_pandigitial
    assert(1234567890.is_pandigital?(0..9), "124567890 is a 0 to 9 pandigital.")
    assert(!123456789.is_pandigital?(0..9), "12346789 is not a 0 to 9 pandigital.");
  end
  
  def test_fibonacci
    assert(1.is_fibonacci?, "1 is the first & second fibonacci numbers")
    assert(8.is_fibonacci?, "8 is the sixth fibonacci number")
  end
  
  def test_length
    assert_equal(2, 10.length, "10 has a length of 2")
    assert_equal(4, 4563.length, "4563 has a length of 4")
  end
end