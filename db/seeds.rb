# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

users = [
  User.new({username: 'Fiorina', password_digest: '12345'}),
  User.new({username: 'Trump', password_digest: '12344'}),
  User.new({username: 'Carson', password_digest: '12343'}),
  User.new({username: 'Clinton', password_digest: '12342'})
]



profiles = [
  Profile.new({ first_name: 'Carly', last_name: 'Fiorina', birth_year: 1954, gender: "female" }),
  Profile.new({ first_name: 'Donald', last_name: 'Trump', birth_year: 1946, gender: "male" }),
  Profile.new({ first_name: 'Ben', last_name: 'Carson', birth_year: 1951, gender: "male" }),
  Profile.new({ first_name: 'Hillary', last_name: 'Clinton', birth_year: 1947, gender: "female" })
]

i = 0
users.each do |u|
  u.profile = profiles[i]
  todo_list = TodoList.create(list_due_date: (Date.today + 1.year))
  u.todo_lists << todo_list
  5.times do |i|
    todo_list.todo_items << TodoItem.create(
      title: "title #{i}", 
      description: "description #{i}", 
      due_date: (Date.today + 1.year)
      )
  end
  i += 1
end




users.each { |u| u.save }
profiles.each { |p| p.save }
