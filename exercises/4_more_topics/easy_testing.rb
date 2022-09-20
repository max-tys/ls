require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError
end

class Employee
  def hire
    raise NoExperienceError
  end
end

class TestExercise < Minitest::Test
  def test_odd
    value = 101
    assert(value.odd?, 'value is not odd')
  end

  def test_downcase
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end

  def test_nil
    value = nil
    assert_nil(value)
  end

  def test_empty_list
    list = []
    assert_empty(list)
  end

  def test_xyz_in_list
    list = ['xyz']
    assert_includes(list, 'xyz')
  end

  def test_no_experience_error
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end

  def test_numeric_class_type
    value = Numeric.new
    assert_instance_of(Numeric, value)
  end

  def test_numeric_kind
    value = 1
    assert_kind_of(Numeric, value)
  end

  def test_xyz_not_in_list
    list = ['xyz']
    refute_includes(list, 'xyz')
  end
end