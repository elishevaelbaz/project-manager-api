# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts ("destroying all data...")

User.destroy_all
Board.destroy_all
Membership.destroy_all
Category.destroy_all
Task.destroy_all
Comment.destroy_all
Attachment.destroy_all
Label.destroy_all
Mention.destroy_all
TaskLabel.destroy_all

puts ("seeding...")
u1 = User.create(username: "elisheva", password: "1234", avatar: "helen")
u2 = User.create(username: "Sally", password: "1234", avatar: "jenny")
u3 = User.create(username: "annie", password: "1234", avatar: "stevie")
u4 = User.create(username: "mike", password: "1234", avatar: "elliot")
u5 = User.create(username: "Don", password: "1234", avatar: "christian")
u6 = User.create(username: "nelly", password: "1234", avatar: "nan")


b1 = Board.create(name: "Plan our vacation", owner_id: u1.id)
b2 = Board.create(name: "Mod 6", owner_id: u2.id)
b3 = Board.create(name: "Job Search Journey", owner_id: u1.id)
b4 = Board.create(name: Faker::App.name, owner_id: u2.id)

ub1 = Membership.create(user_id: u1.id, board_id: b1.id)
ub2 = Membership.create(user_id: u2.id, board_id: b1.id)
ub3 = Membership.create(user_id: u4.id, board_id: b1.id)
ub4 = Membership.create(user_id: u2.id, board_id: b2.id)
ub5 = Membership.create(user_id: u1.id, board_id: b2.id)
ub6 = Membership.create(user_id: u1.id, board_id: b3.id)
ub7 = Membership.create(user_id: u5.id, board_id: b1.id)

c1 = Category.create(name: "Things to do", board_id: b1.id)
c2 = Category.create(name: "Places to eat", board_id: b1.id)
c3 = Category.create(name: "Attractions", board_id: b1.id)
c4 = Category.create(name: "todo", board_id: b2.id)
c5 = Category.create(name: "in progress", board_id: b2.id)
c6 = Category.create(name: "complete", board_id: b2.id)

t1 = Task.create(name: "relax at the beach", category_id: c1.id, created_by: u1.username, position: 1)
t2 = Task.create(name: "warner bros studio tour", category_id: c1.id, created_by: u5.username, position: 2)
t3 = Task.create(name: "kayaking", description: "Boat rental is $25 for the first hour", category_id: c1.id, created_by: u2.username, assigned_to: "elisheva", position: 3)
t4 = Task.create(name: "row boating", category_id: c1.id, created_by: u1.username, position: 4)
t5 = Task.create(name: "walk the boardwalk", description: "beach has a great boardwalk", category_id: c1.id, created_by: u2.username, assigned_to: "Sally", position: 5)
t6 = Task.create(name: "zoo", category_id: c1.id, created_by: u5.username, position: 6)
t7 = Task.create(name: "Little Italy Pizzeria", description: "11712 San Vicente Blvd Los Angeles, CA 90049 (310) 481-7108", category_id: c2.id, created_by: u1.username, position: 1, assigned_to: "mike")
t7a = Task.create(name: "The Steakhouse", description: "123 Lorem Ipsum Blvd Los Angeles, CA 90049", category_id: c2.id, created_by: u4.username, position: 2, assigned_to: "Don")
t7b = Task.create(name: "Lucky Chinese", description: "123 Lorem Ipsum Blvd Los Angeles, CA 90049 ", category_id: c2.id, created_by: u4.username, position: 3, assigned_to: "elisheva")
t7c = Task.create(name: "Ice Cream Parlor", description: "123 Lorem Ipsum Blvd Los Angeles, CA 90049", category_id: c2.id, created_by: u4.username, position: 4, assigned_to: "mike")
t8 = Task.create(name: "Aquarium", category_id: c3.id, created_by: u2.username, position: 1)
t9 = Task.create(name: Faker::Marketing.buzzwords, description: Faker::Lorem.paragraph, category_id: c4.id, created_by: u1.username, position: 1)
t10 = Task.create(name: Faker::Marketing.buzzwords, description: Faker::Lorem.paragraph, category_id: c5.id, created_by: u2.username, assigned_to: "Don", position: 1)
t11 = Task.create(name: Faker::Marketing.buzzwords, description: Faker::Lorem.paragraph, category_id: c6.id, created_by: u1.username, position: 1, assigned_to: "Sally")

cm1 = Comment.create(task_id: t1.id, user_id: u2.id, text: "Don't forget the umbrella")
cm2 = Comment.create(task_id: t2.id, user_id: u1.id, text: "I heard good things about this")
cm3 = Comment.create(task_id: t2.id, user_id: u2.id, text: "Do they have a cafeteria?")
cm4 = Comment.create(task_id: t6.id, user_id: u1.id, text: "I love the zoo!")
cm5 = Comment.create(task_id: t6.id, user_id: u2.id, text: "Remind me to bring a hat")
# cm8 = Comment.create(task_id: t2.id, user_id: u4.id, text: Faker::Lorem.paragraph)
# cm9 = Comment.create(task_id: t4.id, user_id: u2.id, text: Faker::Lorem.paragraph)

l1 = Label.create(name: "indoor", board_id: b1.id, color: "orange")
l2 = Label.create(name: "outdoor", board_id: b1.id, color: "olive")
l3 = Label.create(name: "lunch", board_id: b1.id, color: "violet")
l4 = Label.create(name: "priority", board_id: b1.id, color: "red")
l5 = Label.create(name: "dinner", board_id: b1.id, color: "pink")

tl1 = TaskLabel.create(task_id: t6.id, label_id: l2.id)
tl2 = TaskLabel.create(task_id: t7.id, label_id: l3.id)
tl2a = TaskLabel.create(task_id: t7a.id, label_id: l5.id)
tl2b = TaskLabel.create(task_id: t7c.id, label_id: l5.id)
tl3 = TaskLabel.create(task_id: t3.id, label_id: l4.id)
tl4 = TaskLabel.create(task_id: t6.id, label_id: l4.id)
tl5 = TaskLabel.create(task_id: t2.id, label_id: l2.id)


puts ("seed complete!")