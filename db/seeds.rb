# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Start seeding titles'
Title.create(short_title: 'M.', long_title: 'Monsieur')
Title.create(short_title: 'Mme', long_title: 'Madame')
Title.create(short_title: 'Dr.', long_title: 'Docteur')
Title.create(short_title: 'Pr.', long_title: 'Professeur')
puts 'Seeding titles ended'
