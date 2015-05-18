require 'minitest_helper'

class TestRefactoringRubyEdition < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RefactoringRubyEdition::VERSION
  end
end
