require 'sequel'
require 'pg'

# Sequel.connect
DB = Sequel.connect(adapter: :postgres, user: 'postgres', password: 'root', host: 'localhost', port: 5432, database: 'test')

# DB.create_table
DB.create_table :people do
  primary_key :id
  String :first_name
  String :last_name
  Integer :age
end

people = DB[:people]
people.insert(first_name: 'Fred', last_name: 'Bloggs', age: 32)

puts "There're #{people.count} people in the database"

people.each do |person|
  puts person['first_name']
end

DB.fetch("SELECT * FROM people;") do |row|
  puts row['first_name']
end
