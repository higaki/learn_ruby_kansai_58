require 'test/unit'
require './person'

require 'kagemusha/time'
require 'mocha/setup'
require 'rr'

class TestPerson < Test::Unit::TestCase
  def setup
    @person = Person.new('matz', Time.local(1965, 4, 14))
  end

  def test_age
    assert_equal(48, @person.age)
  end

  def test_kagemusha
    Kagemusha::Time.at(2013, 6, 15) do
      assert_equal(48, @person.age)
    end
  end

  def test_mocha
    Time.stubs(:now).returns(Time.local(2013, 6, 15))
    assert_equal(48, @person.age)
  end

  def test_rr
    mock(Time).now{Time.local(2013, 6, 15)}
    assert_equal(48, @person.age)
  end
end
