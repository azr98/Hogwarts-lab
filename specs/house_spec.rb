require('minitest/autorun')
require('minitest/reporters')



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/House')

class TestHouse < MiniTest::Test

  def test_create_house
    house1 = House.new({
      'name' => 'Ravenclaw',
      'image_url' => 'https://i.pinimg.com/564x/0a/b2/e0/0ab2e0c627b9ee2558471fef443ad8cd.jpg'
      })
      assert_equal('Ravenclaw',house1.name)
  end

end
