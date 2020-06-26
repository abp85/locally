# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

p "Nico's cat is destroyig all tables"

Vote.destroy_all
Report.destroy_all
Category.destroy_all
User.destroy_all

p "Nico's cat is creating Users..."

30.times do
  fName = Faker::Name.first_name
  User.create(first_name: fName, last_name: Faker::Name.last_name, email: Faker::Internet.email(name: fName, domain: 'mail.com'), password: '123456', password_confirmation: '123456')
end

p "Nico's cat is creating Categories..."

catValue = ["Parks & public spaces", "Waterworks", "Electricity", "Infrastructure", "Healthcare", "Education", "Transportation" , "Police", "Waste"]
catValPos = 0
9.times do
  Category.create(name: "#{catValue[catValPos]}")
  catValPos += 1
end

p "Nico's cat is creating Reports..."

repNum = 1
area = ["Raval",
       "Gotico",
       "Gracia",
       "Poblenou"]
loc = ["Carrer de Sant Pau 44, Barcelona",
       "Rambla del Raval 4, Barcelona",
       "Carrer de l'Hospital 46, Barcelona",
       "Carrer de l'Arc del Teatre 9, Barcelona",
       "Carrer de la Riera Alta 23, Barcelona",
       "Carrer de Jaume I 14, Barcelona",
       "Carrer Nou de Sant Francesc 1, Barcelona",
       "Carrer dels Còdols 12, Barcelona",
       "Plaça de les Olles, Barcelona",
       "Passeig de Picasso 40, Barcelona",
       "Carrer de Verdi 2, Barcelona",
       "Carrer d'Astúries 4, Barcelona",
       "Carrer de Maria 7, Barcelona",
       "Carrer dels Almogàvers 122, Barcelona",
       "Carrer de Zamora 78, Barcelona",
       "Rambla del Poblenou, 122, Barcelona"]
repTitle = ["Broken park bench",
       "Dangerous pothole",
       "Piles of trash",
       "Burnt out Streetlight",
       "Noisy traffic",
       "Sewage leak",
       "Plants need watering",
       "Noisy night club",
       "Smelly dog poop",
       "Bicycle path",
       "Parking situation",
       "Power plant",
       "Homeless shelter",
       "Defect traffic light",
       "Soccer pitch",
       "Missing elevator" ]
repDesc = ["This park bench in Carrer de Sant Pau has been broken for several months now and has to be replaced! It is very dangerous for elderly people and young children.",
       "There is a dangerous pothole on Rambla del Raval that already lead to several accidents. It should be fixed as soon as possible!",
       "The trash cans are always full and never get emptied. It attracts rats and other animals and smells horrible! This has to change.",
       "One of the street lights in Carrer de l'Arc del Teatre is burnt out and should be replaced. It is a dark alley and especially during the night it is dangerous.",
      "The expansion of Carrer de la Riera Alta has lead to serious noise issues for residents. We can't sleep at night anymore and the pollution is horrible.",
      "There has been a sewage leak on Carrer de Jaume I. It needs to be fixed immediately, the smell is disgusting and drives out the tourists.",
      "The entire flower bed on Carrer Nou de Sant Francesc  needs watering! The plants are dying out due to the immense heat.",
      "The opening of the Pacha night club has brought disturbing noise to the neighbourhood and it's impossible to get rest at the weekend. It should not be permitted in a residential area!",
      "People do not collect the poop of their dogs in our neighbourhood and the street is full of dog turds. There city should hand out free plastic bags around the city in order to prevent this.",
      "We need a bicycle path in our neighbourhood! The children are forced to drive in the heavy traffic making it extremely dangerous!",
      "The parking situation on Carrer de Verdi is terrible. It is close to impossible to find a spot to park. The city should construct more parking spaces!",
      "We are agains the construction of the Nuclear Power Plant on Carrer d'Astúries. It would make the neighbourhood unhabitable and we would be forced to move. Not mentioning the toxic radiation and noise that comes with it. Stop it now!!",
      "Authorities should build a homeless shelter in Gracia in order to help the people in need. There are many people living on the streets and they deserve to have a home.",
      "There is a defect traffic light on Carrer dels Almogàvers. It should be fixed asap in order to make the traffic safer.",
      "It would be great to have a public soccer pitch in Poblenou. There is free space in the park which could be used.",
      "There is no elevator in the Metro station Rambla del Poblenou. It is impossible for disabled and elderly people to use the stairs and therefore an elevator should be built!"]
img = ["https://upload.wikimedia.org/wikipedia/commons/2/2b/Ickworth_Park%2C_Suffolk%2C_England_-broken_bench-2March2012.jpg",
       "https://images.theconversation.com/files/233448/original/file-20180824-149463-1hzm435.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=900.0&fit=crop",
       "https://www.dailynews.com/wp-content/uploads/2018/06/TRASH-HAUL-street_trash_2_061618.jpg",
       "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Street_lamp%2C_Edinburgh_New_Town.jpg/1200px-Street_lamp%2C_Edinburgh_New_Town.jpg",
      "https://upload.wikimedia.org/wikipedia/commons/7/75/Great_Portland_Street_London_Traffic.jpg",
      "https://arc-anglerfish-arc2-prod-tbt.s3.amazonaws.com/public/4ABN7POFTFHENBPKDI4QYDLBQY.jpg",
      "https://3kpnuxym9k04c8ilz2quku1czd-wpengine.netdna-ssl.com/wp-content/uploads/2019/05/42615859735_d3100ec492_o.jpg",
      "https://lh3.googleusercontent.com/proxy/ekTl4IqSC2vhmxThoKrALg2QwNjTTBeKIilZ33i6uZ8wbTukn6fnCgFHh1MdOVxeYfwHk1FVodyliOJbX727MgYQR49BMf9N5mVB1tmyZpwqISbF334OMuvB6ZfJQxl6HXZCA9kbkjzGz1BO_qvKrUo",
      "https://static.timesofisrael.com/www/uploads/2018/11/iStock-938520600-e1542280189799.jpg",
      "https://www.swarco.com/sites/default/files/public/hero/image/2018-10/cyclingpath_header.jpg",
      "https://live.staticflickr.com/4099/4774162801_ffb7d48383_b.jpg",
      "https://www.powermag.com/wp-content/uploads/2020/06/uniper-kraftwerk-datteln.jpg",
      "https://s7d2.scene7.com/is/image/TWCNews/12-11-2019_Daytona_Beach_Homeless_Shelter",
      "https://img.blogs.es/smartcitylab/wp-content/uploads/2019/07/vienna-smart-traffic-lights.jpg",
      "https://i.pinimg.com/originals/77/3c/db/773cdbc54faad54f1954648a73e921cd.jpg",
      "https://i.pinimg.com/originals/a1/48/9d/a1489dffc6594d0014a692ec0ef99006.jpg"]

loc.count.times do |repNum|
  file = URI.open("#{img[repNum - 1]}")
  report = Report.create!(title:"#{repTitle[repNum - 1]}", description: "#{repDesc[repNum - 1]}", location: "#{loc[repNum - 1]}", user: User.all.sample, category: Category.all.sample)
  report.photo.attach(io: file, filename: "#{repTitle[repNum - 1].gsub(/\s+/, '_')}.jpg", content_type: 'image/jpg')
end


p "Nico's cat is creating Votes..."

voteValue = ["up",
       "center",
       "down"]
150.times do
  Vote.create(value: "#{voteValue[rand(0..2)]}", user: User.all.sample, report: Report.all.sample)
end

p "Nico's cat has completed the process"


# p "Destroyig all tables"

# Vote.destroy_all
# Report.destroy_all
# Category.destroy_all
# User.destroy_all

# p "Creating Users..."

# 30.times do
#   fName = Faker::Name.first_name
#   User.create(first_name: fName, last_name: Faker::Name.last_name, email: Faker::Internet.email(name: fName, domain: 'mail.com'), password: '123456', password_confirmation: '123456')
# end

# p "Creating Categories..."

# catValue = ["Parks & public spaces", "Waterworks", "Electricity", "Infrastructure", "Healthcare", "Education", "Transportation" , "Police", "Waste"]
# catValPos = 0
# 9.times do
#   Category.create(name: "#{catValue[catValPos]}")
#   catValPos += 1
# end

# p "Creating Reports..."

# repNum = 1
# loc = ["Carrer De Taxdirt 12, Barcelona", "Carrer de Roc Boronat 53, Barcelona", "Carrer De Viladomat 81, Barcelona", "Carrer Dels Corders 25, Barcelona", "Carrer de Llull 170, Barcelona", "Carrer de la Ciutat de Granada 44, Barcelona", "Carrer de Bac de Roda 144, Barcelona", "Carrer d'en Grassot 101, Barcelona", "Carrer de Rabassa 32, Barcelona", "Carrer de Lincoln 67, Barcelona"]
# 10.times do
#   puts repNum
#   repTitle = Faker::Marketing.buzzwords
#   file = URI.open('https://as2.ftcdn.net/jpg/01/91/15/43/500_F_191154311_XIISKDd8SUxXEE1rudvgxYU3uNTETJXq.jpg')
#   report = Report.create!(title: repTitle.truncate(30), description: '-', location: "#{loc[repNum - 1]}", user: User.all.sample, category: Category.all.sample)
#   report.photo.attach(io: file, filename: "#{repTitle.gsub(/\s+/, '_')}.jpg", content_type: 'image/jpg')
#   repNum += 1
# end

# p "Creating Votes..."

# voteValue = ["up", "center", "down"]
# 150.times do
#   Vote.create(value: "#{voteValue[rand(0..2)]}", user: User.all.sample, report: Report.all.sample)
# end

# p "Process completed"
