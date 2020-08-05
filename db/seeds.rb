# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts ("seeding...")
u1 = User.create(username: Faker::Name.first_name, password: "1234")
u2 = User.create(username: Faker::Name.first_name, password: "1234")
u3 = User.create(username: Faker::Name.first_name, password: "1234")
u4 = User.create(username: Faker::Name.first_name, password: "1234")

b1 = Board.create(name: Faker::App.name, owner_id: u1.id)
b2 = Board.create(name: Faker::App.name, owner_id: u2.id)

ub1 = UserBoard.create(user_id: u1.id, board_id: b1.id)
ub2 = UserBoard.create(user_id: u2.id, board_id: b1.id)
ub3 = UserBoard.create(user_id: u4.id, board_id: b1.id)
ub1 = UserBoard.create(user_id: u2.id, board_id: b2.id)

c1 = Category.create(name: "todo", board_id: b1.id)
c2 = Category.create(name: "in progress", board_id: b1.id)
c3 = Category.create(name: "complete", board_id: b1.id)
c4 = Category.create(name: "todo", board_id: b2.id)

t1 = Task.create(name: Faker::Marketing.buzzwords, description: Faker::Lorem.paragraph, category_id: c1.id, created_by: u1.id)
t2 = Task.create(name: Faker::Marketing.buzzwords, description: Faker::Lorem.paragraph, category_id: c1.id, created_by: u2.id)
t3 = Task.create(name: Faker::Marketing.buzzwords, description: Faker::Lorem.paragraph, category_id: c2.id, created_by: u2.id)
t4 = Task.create(name: Faker::Marketing.buzzwords, description: Faker::Lorem.paragraph, category_id: c3.id, created_by: u4.id)

cm1 = Comment.create(task_id: t1.id, user_id: u1.id, text: Faker::Lorem.paragraph)
cm2 = Comment.create(task_id: t1.id, user_id: u1.id, text: Faker::Lorem.paragraph)
cm3 = Comment.create(task_id: t2.id, user_id: u4.id, text: Faker::Lorem.paragraph)
cm4 = Comment.create(task_id: t4.id, user_id: u2.id, text: Faker::Lorem.paragraph)

puts ("seed complete!")