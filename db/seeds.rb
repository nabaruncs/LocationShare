# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
p 'Create Users...'

user = User.create(email: "nabaruncs@yahoo.com", password: "nabarun", user_name: "nabarun")
friend1 = User.create(friend_id: user.id, email: "nabaruncs+1@yahoo.com", password: "nabarun", user_name: "nabarun1")
friend2 = User.create(friend_id: user.id, email: "nabaruncs+2@yahoo.com", password: "nabarun", user_name: "nabarun2")
