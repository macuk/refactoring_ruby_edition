require 'minitest_helper'

module RefactoringRubyEdition
  class TestCustomer < Minitest::Test
    def setup
      @over_the_top = Movie.new('Over the Top', Movie::REGULAR)
      @mr_holmes = Movie.new('Mr. Holmes', Movie::NEW_RELEASE)
      @toy_story = Movie.new('Toy Story', Movie::CHILDRENS)

      @alice = Customer.new('Alice')
    end

    def test_no_movie
      out = "Rental Record for Alice\n"
      out << "Amount owed is 0\n"
      out << "You earned 0 frequent renter points"
      assert_equal out, @alice.statement
    end

    def test_one_movie_rental
      @alice.add_rental(Rental.new(@over_the_top, 2))
      out = "Rental Record for Alice\n"
      out << "\tOver the Top\t2\n"
      out << "Amount owed is 2\n"
      out << "You earned 1 frequent renter points"
      assert_equal out, @alice.statement
    end

    def test_two_movies
      @alice.add_rental(Rental.new(@over_the_top, 3))
      @alice.add_rental(Rental.new(@mr_holmes, 1))
      out = "Rental Record for Alice\n"
      out << "\tOver the Top\t3.5\n"
      out << "\tMr. Holmes\t3\n"
      out << "Amount owed is 6.5\n"
      out << "You earned 2 frequent renter points"
      assert_equal out, @alice.statement
    end

    def test_all_movies
      @alice.add_rental(Rental.new(@over_the_top, 6))
      @alice.add_rental(Rental.new(@mr_holmes, 4))
      @alice.add_rental(Rental.new(@toy_story, 10))
      out = "Rental Record for Alice\n"
      out << "\tOver the Top\t8.0\n"
      out << "\tMr. Holmes\t12\n"
      out << "\tToy Story\t12.0\n"
      out << "Amount owed is 32.0\n"
      out << "You earned 4 frequent renter points"
      assert_equal out, @alice.statement
    end

    def test_rent_two_the_same_movies
      @alice.add_rental(Rental.new(@over_the_top, 1))
      @alice.add_rental(Rental.new(@over_the_top, 5))
      out = "Rental Record for Alice\n"
      out << "\tOver the Top\t2\n"
      out << "\tOver the Top\t6.5\n"
      out << "Amount owed is 8.5\n"
      out << "You earned 2 frequent renter points"
      assert_equal out, @alice.statement
    end
  end
end
