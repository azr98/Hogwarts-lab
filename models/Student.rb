require_relative('../db/sql_runner')

class Student

  attr_accessor :first_name, :last_name, :house_id, :age
  attr_reader :id

  def initialize(student_details)
    @id = student_details['id'].to_i if student_details['id']
    @first_name = student_details['first_name']
    @last_name = student_details['last_name']
    @age = student_details['age'].to_i
    @house_id = student_details['house_id'].to_i
    #if student_details['house_id']
  end


  def save
    sql = "INSERT INTO students (first_name,last_name,house_id
    ,age) VALUES ($1,$2,$3,$4) RETURNING id"
    values = [@first_name,@last_name,@house_id,@age]
    result = SqlRunner.run(sql,values)
    @id = result[0]['id'].to_i
  end


  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map{|student| Student.new(student)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql,values)
    return Student.new(student[0])
  end

  def house
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house_id]
    result = SqlRunner.run(sql,values)
    return House.new(result[0])
  end


end
