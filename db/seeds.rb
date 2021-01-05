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

puts ''
puts 'start seeding membership types'
MembershipType.create(short_name: 'S1', long_name: 'Speaker 1')
MembershipType.create(short_name: 'S2', long_name: 'Speaker 2')
MembershipType.create(short_name: 'S3', long_name: 'Speaker 3')
MembershipType.create(short_name: 'D1', long_name: 'Deputy Speaker 1')
MembershipType.create(short_name: 'D2', long_name: 'Deputy Speaker 2')
MembershipType.create(short_name: 'D3', long_name: 'Deputy Speaker 3')
MembershipType.create(short_name: 'D4', long_name: 'Deputy Speaker 4')
MembershipType.create(short_name: 'IM', long_name: 'Member (informed')
MembershipType.create(short_name: 'AM', long_name: 'Member (active)')
MembershipType.create(short_name: 'C', long_name: 'Conveynor')
MembershipType.create(short_name: 'P', long_name: 'President')
MembershipType.create(short_name: 'Se', long_name: 'Secretary')



puts 'seeding membership types ended'

filepath = 'db/seed_data/bodies.csv'
puts ''
puts 'Seeding bodies started'
CSV.foreach(filepath) do |row|
  if Body.create(short_name: row[0], long_name: row[1], parent_id: row[2],
      comment: row[4], starting_date: row[5],
      ending_date: row[6])
    puts "Body: #{row[0]} - #{row[0]}, #{row[1]} -> OK "
  else
    puts "Attention! Body: #{row[0]} - #{row[1]}} -> NOK "
  end
end
puts 'Seeding bodies ended'

filepath = 'db/seed_data/experts.csv'
puts ''
puts 'Seeding experts started'
CSV.foreach(filepath) do |row|
  if Expert.create(title_id: row[0], last_name: row[1], first_name: row[2],
       active: row[3], body_id: row[4])
    puts "Expert: #{row[1]} -> OK "
  else
    puts "Expert: #{row[1]} -> NOK "
  end
end

puts ''
puts 'Seeding process ended'
