# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Passport.destroy_all
User.destroy_all

puts 'Creating 100 fake users...'
50.times do
  user = User.create(
    username:     Faker::Movies::StarWars.character,
    email:        Faker::Internet.email,
    password:     Faker::Internet.password
  )
end

puts 'Creating 100 fake passports...'
50.times do
  passport = Passport.new(
    country:                    Faker::Movies::StarWars.planet,
    gender:                     Faker::Gender.type,
    social_security_number:     Faker::NationalHealthService.british_number,
    brand_name:                 ["Pfizer", "Moderna", "Johnson & Johnson", "Astrazeneca", "Sinopharm", "Cuba Libre"].sample,
    price_per_day:              (10..20),
    avaibility_date:            Date.today
 )
  passport.user = User.all.sample
  passport.save!
end


puts 'Finished!'

