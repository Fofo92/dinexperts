# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts 'Start seeding titles'
Title.create(short_title: 'M.', long_title: 'Monsieur')
Title.create(short_title: 'Mme', long_title: 'Madame')
Title.create(short_title: 'Dr.', long_title: 'Docteur')
Title.create(short_title: 'Pr.', long_title: 'Professeur')
puts 'Seeding titles ended'


# INSERT INTO experts (title_id, last_name, first_name, comment, created_at, updated_at) VALUES
filepath = 'db/seed_data/experts.csv'

puts ''
puts 'Start seeding experts'
CSV.foreach(filepath) do |row|
  if Expert.create(title_id: row[0], last_name: row[1], first_name: row[2])
    puts "Expert: #{row[0]}, #{row[1]} -> OK "
  else
    puts "Expert: #{row[0]}, #{row[1]} -> NOK "
  end
puts 'End seeding experts'
end

