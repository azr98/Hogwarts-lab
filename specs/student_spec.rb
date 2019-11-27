
require('minitest/autorun')
require('minitest/reporters')



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/Student')


class TestStudent < MiniTest::Test

  def test_create_student
    student1 = Student.new({
      'first_name' => 'Azhar',
      'last_name' => 'Sharif',
      'house' => 'Slytherin',
      'age' => '21'
      })
      assert_equal('Azhar',student1.first_name)
  end

end
