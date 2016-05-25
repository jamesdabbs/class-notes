require "pry"
require "minitest/autorun"
require "minitest/focus"

begin
  require "minitest/reporters"
  Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new
rescue LoadError
  warn "`gem install minitest-reporters` for pretty test output"
end

class Person
  def initialize first, last=nil
    @first = first
    @last  = last
  end

  def self.parse string
    first, last = string.split " "
    Person.new first, last
  end

  def first_name
    @first
  end

  def last_name
    @last
  end

  def name
    "#{first_name} #{last_name}".strip
  end
end

class PersonTests < Minitest::Test
  def test_people_have_first_names
    p = Person.new "Katie", "Walsh"
    assert_equal "Katie", p.first_name
  end

  def test_people_have_last_names
    p = Person.new "Russell", "Osborne"
    assert_equal "Osborne", p.last_name
  end

  def test_people_have_full_names
    p = Person.new "James", "Dabbs"
    assert_equal "James Dabbs", p.name
  end

  def test_some_people_dont_have_last_names
    p = Person.new "Madonna"
    assert_equal "Madonna", p.name
  end

  # Harder!
  def test_you_can_build_a_person_from_a_full_name
    p = Person.parse "Dana Calder"
    assert_equal "Dana", p.first_name
  end
end
