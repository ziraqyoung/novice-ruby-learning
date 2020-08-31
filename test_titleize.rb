class String
  def titleize
    self.gsub(/(\A|\s)\w/) { |letter| letter.upcase }
  end
end

# step one - load minitest/autorun
require 'minitest/autorun'

# define class start with Test< Minitest::Test
class TestTitleize < Minitest::Test
  # define methods that starts with test_

  # def test_basic
    # assert_equal 'This Is A Test', 'this is a test'.titleize
    # assert_equal 'Another Test 123', 'another test 123'.titleize
    # assert_equal "We're Testing Titleize", "We're testing titleize".titleize
    # assert_equal "Let's Make This Fails", "foo".titleize
  # end

  # def test_assertions
    # assert_raises(ZeroDivisionError) { 2 / 0 }
    # assert_instance_of(Hash, {a: 2})
  # end

  # def test_flunk
    # flunk('fix this wierd untracable message')
  # end
end

# raise 'Fail 1' unless 'this is a test'.titleize == 'This Is A Test'
# raise 'Fail 2' unless 'another test 123'.titleize == 'Another Test 123'
# raise 'Fail 3' unless "We're testing titleize".titleize == "We're Testing Titleize"

