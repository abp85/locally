# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

p "Destroyig all tables"

Vote.destroy_all
Report.destroy_all
Category.destroy_all
User.destroy_all

p "Creating Users..."

30.times do
  fName = Faker::Name.first_name
  User.create(first_name: fName, last_name: Faker::Name.last_name, email: Faker::Internet.email(name: fName, domain: 'mail.com'), password: '123456', password_confirmation: '123456')
end

p "Creating Categories..."

catValue = ["Electricity", "Woodwork", "Roadwork", "Concrete", "Water", "Phone-Lines"]
catValPos = 0
6.times do
  Category.create(name: "#{catValue[catValPos]}")
  catValPos += 1
end

p "Creating Reports..."

repNum = 1
loc = ["Carrer De Taxdirt 12, Barcelona", "Carrer de Roc Boronat 53, Barcelona", "Carrer De Viladomat 81, Barcelona", "Carrer Dels Corders 25, Barcelona", "Carrer de Llull 170, Barcelona", "Carrer de la Ciutat de Granada 44, Barcelona", "Carrer de Bac de Roda 144, Barcelona", "Carrer d'en Grassot 101, Barcelona", "Carrer de Rabassa 32, Barcelona", "Carrer de Lincoln 67, Barcelona"]
10.times do
  puts repNum
  repTitle = Faker::Marketing.buzzwords
  file = URI.open('https://as2.ftcdn.net/jpg/01/91/15/43/500_F_191154311_XIISKDd8SUxXEE1rudvgxYU3uNTETJXq.jpg')
  report = Report.create!(title: repTitle.truncate(30), description: '-', location: "#{loc[repNum - 1]}", user_id: rand(1..30), category_id: rand(1..6))
  report.photo.attach(io: file, filename: "#{repTitle.gsub(/\s+/, '_')}.jpg", content_type: 'image/jpg')
  repNum += 1
end

p "Creating Votes..."

voteValue = ["up", "center", "down"]
150.times do
  Vote.create(value: "#{voteValue[rand(0..2)]}", user_id: rand(1..30), report_id: rand(1..10))
end

p "Process completed"
