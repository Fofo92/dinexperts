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

puts 'Start seeding bodies'
Body.create(short_name: 'SNCF', long_name: 'Société nationale des chemins de fer français')
Body.create(short_name: 'SNCF Réseau', long_name: 'SNCF Réseau', parent_id: 1)
Body.create(short_name: 'SNCF Voyageurs', long_name: 'SNCF Voyageurs', parent_id: 1)
Body.create(short_name: 'SNCF Fret', long_name: 'SNCF Fret', parent_id: 1)
Body.create(short_name: 'SNCF Gares & connexions', long_name: 'SNCF Gares & connexions', parent_id: 2)
Body.create(short_name: 'Systra', long_name: 'Systra')
Body.create(short_name: 'UIC', long_name: 'Union internationale des chemins de fer')
Body.create(short_name: 'CEN', long_name: 'Comité européen de normalisation')
Body.create(short_name: 'TC 256', long_name: 'Applications ferroviaires', parent_id: 7)
Body.create(short_name: 'CE', long_name: 'Commission Européenne')
Body.create(short_name: 'EUAR', long_name: "Agence de l'Union européenne pour le chemin de fer", parent_id: 9)
Body.create(short_name: 'TWG CBB', long_name: "Topical Working Group Composite Brake Blocks", parent_id: 10)
puts 'Seeding bodies ended'

# INSERT INTO experts (title_id, last_name, first_name, comment, created_at, updated_at) VALUES
filepath = 'db/seed_data/experts.csv'

puts ''
puts 'Start seeding experts'
CSV.foreach(filepath) do |row|
  if Expert.create(title_id: row[0], last_name: row[1], first_name: row[2], active: row[3], body_id: row[4])
    puts "Expert: #{row[1]}, #{row[2]} -> OK "
  else
    puts "Expert: #{row[1]}, #{row[2]} -> NOK "
  end
end
puts 'End seeding experts'


