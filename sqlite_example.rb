require "sqlite3"

# db connection and configurations
$db = SQLite3::Database.new "test.db"
$db.results_as_hash = true

# helper methods
def disconnect_and_quit
  $db.close
  puts "Bye!"
  exit
end

# creates people table with attributes name, job, gender and age
def create_table
  puts "Creating people table"
  $db.execute %q{
    CREATE TABLE people(
    id integer primary key,
    name varchar(50),
    job varchar(50),
    gender varchar(6),
    age integer
    )
  }
end

# adds a person by the provided attributes
def add_person
  puts "Enter Name:"
  name = gets.chomp
  puts "Enter Job:"
  job = gets.chomp
  puts "Enter Gender:"
  gender = gets.chomp
  puts "Enter Age:"
  age = gets.chomp

  $db.execute("INSERT INTO people (name, job, gender, age) VALUES (?, ?, ?, ?)", name, job, gender, age)
end

# finds a person by id or name
def find_person
  puts "Enter the name or ID of a person to find:"
  id = gets.chomp

  person = $db.execute("SELECT * FROM people WHERE name = ? OR id = ?", id, id.to_i).first

  unless person
    puts "No record found"
    return
  end

  puts %Q{
    Name: #{person["name"]}
    job: #{person["job"]}
    Gender: #{person["gender"]}
    Age: #{person["age"]}
  }
end

# progam
loop do
  puts %q{Please select an option
    1. Create people table
    2. Add a person
    3. Look for a person
    4. Quit
  }

  case gets.chomp
  when "1"
    create_table
  when "2"
    add_person
  when "3"
    find_person
  when "4"
    disconnect_and_quit
  end
end
