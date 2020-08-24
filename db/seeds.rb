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

250.times do
  fName = Faker::Name.first_name
  User.create(first_name: fName, last_name: Faker::Name.last_name, email: Faker::Internet.email(name: fName, domain: 'mail.com'), password: '123456', password_confirmation: '123456')
end

User.create(first_name: "Alejandro", last_name: "Bringas", email: "alejandro@mail.com", password: "123456", password_confirmation: '123456')
User.create(first_name: "Nicolas", last_name: "Capalbo", email: "nicolas@mail.com", password: "123456", password_confirmation: '123456')
User.create(first_name: "David", last_name: "Ibañez", email: "david@mail.com", password: "123456", password_confirmation: '123456')


p "Nico's cat is creating Categories..."

catValue = ["Public spaces", "Waterworks", "Electricity", "Infrastructure", "Healthcare", "Education", "Transportation" , "Police", "Waste", "Noise"]
catValPos = 0
catValue.count.times do
  Category.create(name: "#{catValue[catValPos]}")
  catValPos += 1
end

voteValue = ["up",
       "center",
       "down"]

p "Nico's cat is creating Reports..."

puts "1"
# "https://upload.wikimedia.org/wikipedia/commons/2/2b/Ickworth_Park%2C_Suffolk%2C_England_-broken_bench-2March2012.jpg"
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1594325154/Locally/dw5pzs22i0wuelx9lkm8cfv7f6za.jpg")
report = Report.create!(title:"Broken park bench", description: "This park bench in Carrer de Sant Pau has been broken for several months now and has to be replaced! It is very dangerous for elderly people and young children.", location: "Carrer de Sant Pau 44, Barcelona", user: User.all.sample, category: Category.all[0], report_votes: 0)
report.photo.attach(io: file, filename: "park-bench.jpg", content_type: 'image/jpg')
report.created_at = DateTime.now-30.days
report.save
puts "3"
# "https://www.dailynews.com/wp-content/uploads/2018/06/TRASH-HAUL-street_trash_2_061618.jpg"
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1594325159/Locally/oqn2k0pfcviy05uj6aqpno2becis.jpg")
report = Report.create!(title:"Piles of trash", description: "The trash cans are always full and never get emptied. It attracts rats and other animals and smells horrible! This has to change.", location: "Carrer de l'Hospital 46, Barcelona", user: User.all.sample, category: Category.all[8], report_votes: 0)
report.photo.attach(io: file, filename: "trash.jpg", content_type: 'image/jpg')
report.created_at = DateTime.now-9.days
80.times do
  Vote.create(value: "#{voteValue[0]}", user: User.all.sample, report: Report.find(2))
end
report.save
puts "4"
# https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Street_lamp%2C_Edinburgh_New_Town.jpg/1200px-Street_lamp%2C_Edinburgh_New_Town.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1594325165/Locally/33pyye10pxxo73987f71s1li496t.jpg")
report = Report.create!(title:"Burnt out Streetlight", description: "One of the street lights in Carrer de l'Arc del Teatre is burnt out and should be replaced. It is a dark alley and especially during the night it is dangerous.", location: "Carrer de l'Arc del Teatre 9, Barcelona", user: User.all.sample, category: Category.all[2], report_votes: 0)
report.photo.attach(io: file, filename: "streetlight.jpg", content_type: 'image/jpg')
report.save
puts "5"
# https://upload.wikimedia.org/wikipedia/commons/7/75/Great_Portland_Street_London_Traffic.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1594325169/Locally/4g8hje24id1sgzn0l5c4sqp95qxw.jpg")
report = Report.create!(title:"Noisy traffic", description: "The expansion of Carrer de la Riera Alta has lead to serious noise issues for residents. We can't sleep at night anymore and the pollution is horrible.", location: "Carrer de la Riera Alta 23, Barcelona", user: User.all.sample, category: Category.all[9], report_votes: 0)
report.photo.attach(io: file, filename: "traffic.jpg", content_type: 'image/jpg')
report.save
puts "6"
# https://arc-anglerfish-arc2-prod-tbt.s3.amazonaws.com/public/4ABN7POFTFHENBPKDI4QYDLBQY.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1594325174/Locally/ckxv32re1jnjp0c5n6i773zl99rq.jpg")
report = Report.create!(title:"Sewage leak", description: "There has been a sewage leak on Carrer de Jaume I. It needs to be fixed immediately, the smell is disgusting and drives out the tourists.", location: "Carrer de Jaume I 14, Barcelona", user: User.all.sample, category: Category.all[1], report_votes: 0)
report.photo.attach(io: file, filename: "sewage.jpg", content_type: 'image/jpg')
report.save
puts "7"
# https://3kpnuxym9k04c8ilz2quku1czd-wpengine.netdna-ssl.com/wp-content/uploads/2019/05/42615859735_d3100ec492_o.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1594325182/Locally/tx3abpy6os3zmxnui88bajvt5cbv.jpg")
report = Report.create!(title:"Plants need watering", description: "The entire flower bed on Carrer Nou de Sant Francesc  needs watering! The plants are dying out due to the immense heat.", location: "Carrer Nou de Sant Francesc 1, Barcelona", user: User.all.sample, category: Category.all[0], report_votes: 0)
report.photo.attach(io: file, filename: "plants.jpg", content_type: 'image/jpg')
report.save
puts "8"
# https://www.clubbookers.com/wp-content/uploads/2017/05/Pacha-Barcelona.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1594325202/Locally/i70wdpp8smmxr096ei6uloujuweh.jpg")
report = Report.create!(title:"Noisy night club", description: "The opening of the Pacha night club has brought disturbing noise to the neighbourhood and it's impossible to get rest at the weekend. It should not be permitted in a residential area!", location: "Carrer dels Còdols 12, Barcelona", user: User.all.sample, category: Category.all[9], report_votes: 0)
report.photo.attach(io: file, filename: "club.jpg", content_type: 'image/jpg')
50.times do
  Vote.create(value: "#{voteValue[0]}", user: User.all.sample, report: Report.find(7))
end
report.created_at = DateTime.now-16.days
report.save
puts "9"
# https://static.timesofisrael.com/www/uploads/2018/11/iStock-938520600-e1542280189799.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1594325206/Locally/389fvi0k0z98vkhb0n1dua1mim9b.jpg")
report = Report.create!(title:"Smelly dog poop", description: "People do not collect the poop of their dogs in our neighbourhood and the street is full of dog turds. There city should hand out free plastic bags around the city in order to prevent this.", location: "Plaça de les Olles, Barcelona", user: User.all.sample, category: Category.all[8], report_votes: 0)
report.photo.attach(io: file, filename: "dog-poop.jpg", content_type: 'image/jpg')
report.save
puts "10"
# https://www.swarco.com/sites/default/files/public/hero/image/2018-10/cyclingpath_header.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1593700355/Locally/lste1jv26lc3ah883pnogp05qmtc.jpg")
report = Report.create!(title:"Bicycle path", description: "We need a bicycle path in our neighbourhood! The children are forced to drive in the heavy traffic making it extremely dangerous!", location: "Passeig de Picasso 40, Barcelona", user: User.all.sample, category: Category.all[6], report_votes: 0)
report.photo.attach(io: file, filename: "bicycle.jpg", content_type: 'image/jpg')
report.created_at = DateTime.now-12.days
report.save
puts "11"
# https://live.staticflickr.com/4099/4774162801_ffb7d48383_b.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1593700358/Locally/a6mjyyg6mqkadxhbu0f3eudu8r89.jpg")
report = Report.create!(title:"Parking situation", description: "The parking situation on Carrer de Verdi is terrible. It is close to impossible to find a spot to park. The city should construct more parking spaces!", location: "Carrer de Verdi 2, Barcelona", user: User.all.sample, category: Category.all[6], report_votes: 0)
report.photo.attach(io: file, filename: "parking.jpg", content_type: 'image/jpg')
30.times do
  Vote.create(value: "#{voteValue[0]}", user: User.all.sample, report: Report.find(10))
end
report.created_at = DateTime.now-8.days
report.save
puts "12"
# https://www.powermag.com/wp-content/uploads/2020/06/uniper-kraftwerk-datteln.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1593700361/Locally/iaof3g8l8lm3aawv6r3qiluj42qk.jpg")
report = Report.create!(title:"Power plant", description: "We are against the construction of the Nuclear Power Plant on Carrer d'Astúries. It would make the neighbourhood unhabitable and we would be forced to move. Not mentioning the toxic radiation and noise that comes with it. Stop it now!!", location: "Carrer d'Astúries 4, Barcelona", user: User.all.sample, category: Category.all[3], report_votes: 0)
report.photo.attach(io: file, filename: "power-plant.jpg", content_type: 'image/jpg')
report.created_at = DateTime.now-22.days
report.save
puts "13"
# https://s7d2.scene7.com/is/image/TWCNews/12-11-2019_Daytona_Beach_Homeless_Shelter
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1593700363/Locally/0592o13xg9ttwpnlumhuexbr4llg.jpg")
report = Report.create!(title:"Homeless shelter", description: "Authorities should build a homeless shelter in Gracia in order to help the people in need. There are many people living on the streets and they deserve to have a home.", location: "Carrer de Maria 7, Barcelona", user: User.all.sample, category: Category.all[0], report_votes: 0)
report.photo.attach(io: file, filename: "homeless.jpg", content_type: 'image/jpg')
report.created_at = DateTime.now-45.days
report.save
puts "14"
# https://img.blogs.es/smartcitylab/wp-content/uploads/2019/07/vienna-smart-traffic-lights.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1593700365/Locally/iv1bxz52d7qosoj1w45lkt3hptjh.jpg")
report = Report.create!(title:"Defect traffic light", description: "There is a defect traffic light on Carrer dels Almogàvers. It should be fixed asap in order to make the traffic safer.", location: "Carrer dels Almogàvers 122, Barcelona", user: User.all.sample, category: Category.all[3], report_votes: 0)
report.photo.attach(io: file, filename: "traffic-light.jpg", content_type: 'image/jpg')
report.created_at = DateTime.now-24.days
report.save
puts "15"
# https://i.pinimg.com/originals/77/3c/db/773cdbc54faad54f1954648a73e921cd.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1593700367/Locally/2944hkh5vfs0u5kt28ll80x9c54p.jpg")
report = Report.create!(title:"Soccer pitch", description: "It would be great to have a public soccer pitch in Poblenou. There is free space in the park which could be used.", location: "Carrer de Zamora 78, Barcelona", user: User.all.sample, category: Category.all[0], report_votes: 0)
report.photo.attach(io: file, filename: "soccer.jpg", content_type: 'image/jpg')
report.created_at = DateTime.now-8.days
report.save
puts "16"
# https://i.pinimg.com/originals/a1/48/9d/a1489dffc6594d0014a692ec0ef99006.jpg
file = URI.open("https://res.cloudinary.com/dtuwnjtdh/image/upload/v1593700369/Locally/h887t0sl4746h9yxxmbxpamsxhk2.jpg")
report = Report.create!(title:"Missing elevator", description: "There is no elevator in the Metro station Rambla del Poblenou. It is impossible for disabled and elderly people to use the stairs and therefore an elevator should be built!", location: "Rambla del Poblenou, 122, Barcelona", user: User.all.sample, category: Category.all[3], report_votes: 0)
report.photo.attach(io: file, filename: "elevator.jpg", content_type: 'image/jpg')
report.created_at = DateTime.now-33.days
report.save
p "Nico's cat is creating Votes..."


1000.times do
  Vote.create(value: "#{voteValue[0]}", user: User.all.sample, report: Report.all.sample)
end

User.create(first_name: "Francesco", last_name: "Biedermann", email: "francesco@mail.com", password: "123456", password_confirmation: '123456')

p "Nico's cat has completed the process"
