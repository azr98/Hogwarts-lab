require('pry')

require_relative('../models/Student')
require_relative('../models/House')

Student.delete_all
House.delete_all

house1 = House.new({
  'name' => 'Ravenclaw',
  'image_url' => 'https://i.pinimg.com/564x/0a/b2/e0/0ab2e0c627b9ee2558471fef443ad8cd.jpg'
  })

house1.save

  house2 = House.new({
    'name' => 'Slytherin',
    'image_url' => 'https://carlisletheacarlisletheatre.org/images/harry-potter-clip-art-slytherin-4.png'
    })

  house2.save

  house3 = House.new({
    'name' => 'Gryffindor',
    'image_url' => 'https://pixy.org/src/54/546729.jpg'
    })

  house3.save


  house4 = House.new({
    'name' => 'Hufflepuff',
    'image_url' => 'https://www.pngfind.com/pngs/m/115-1150321_what-hogwarts-house-am-i-in-harry-potter.png'
    })

house4.save

student1 = Student.new({
  'first_name' => 'Azhar',
  'last_name' => 'Sharif',
  'house' => 'Slytherin',
  'house_id' => house1.id,
  'age' => '21'
  })

student1.save

student2 = Student.new({
  'first_name' => 'Eleanor',
  'last_name' => 'Casson',
  'house_id' => house2.id,
  'age' => '19'
  })

  student2.save



binding.pry

nil
