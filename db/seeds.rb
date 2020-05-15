# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "test",
             email: "test@test",
             password:              "11111111",
             password_confirmation: "11111111",
             admin: true)

User.create!(name:  "aaa",
             email: "aaa@aaa",
             password:              "11111111",
             password_confirmation: "11111111",
             admin: false)
          
User.create!(name:  "bbb",
             email: "bbb@bbb",
             password:              "11111111",
             password_confirmation: "11111111",
             admin: false)

User.create!(name:  "ccc",
             email: "ccc@ccc",
             password:              "11111111",
             password_confirmation: "11111111",
             admin: false)

#4.times do |n|
#name  = Faker::Name.name
#email = "example-#{n+1}@railstutorial.org"
#password = "password"
#User.create!(name:  name,
              #email: email,
              #password:              password,
              #password_confirmation: password)
#end