

class House

  attr_accessor :name, :image_url
  attr_reader :id

  def initialize(house_details)
    @id = house_details['id'].to_i if house_details['id']
    @name = house_details['name']
    @image_url = house_details['image_url']
  end

  def save
    sql = "INSERT INTO houses (name,image_url) VALUES ($1,$2) RETURNING id"
    values = [@name,@image_url]
    house = SqlRunner.run(sql,values)
    @id = house[0]['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    return houses.map{|house| House.new(house)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql,values)
    return House.new(house[0])
  end


end
