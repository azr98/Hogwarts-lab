require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('./models/Student')
require_relative('./models/House')
also_reload('./models/*')

#index
get '/students' do
  @students = Student.all

  erb(:"student/index")
end

#new
get '/students/new' do
  @houses = House.all
  erb(:'student/new')
end


post '/students' do
  @student = Student.new(params)
  @student.save
  redirect('/students')
end
