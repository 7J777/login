require 'csv'
connected=false
age=0

csv_file_path = '/Users/clovis/Desktop/data/users.csv'
admin_csv_path = '/Users/clovis/Desktop/data/admin.csv'

if File.exist?(csv_file_path)
  users = CSV.table(csv_file_path).map(&:to_h)
else
  users = []
end

if File.exist?(admin_csv_path)
  admins = CSV.table(admin_csv_path).map(&:to_h)
else
  admins = []
end

puts "have you an account (yes/no) ?"
answer = gets.chomp


##connection##
if answer == "yes"
    while connected==false
     
      puts "what is your pseudo?"
      id = gets.chomp
      puts "what is your password?"
      password = gets.chomp
      if users.any? { |user| user[:id] == id && user[:password] == password }
          puts "hello you are connected"
          connected=true
      else
         puts "pseudo or password is incorrect"
      end
    end
else
    connected=false
    puts "you'll create an account"
end





##inscription##
if connected==false 
  puts "what is your first name?"
  first_name = gets.chomp
  puts "what is your last name?"
  last_name = gets.chomp
  puts "what is your city?"
  city = gets.chomp
  while age == 0
      puts "what is your age?"
      age = gets.chomp.to_i
      if age ==0
          puts "veuillez entrer un nombre"
      end
  end
  puts "choose a pseudo"
  id = gets.chomp.to_s
  puts "choose a password"
  password = gets.chomp.to_s
  puts "Bonjour, #{first_name} #{last_name} tu habites à #{city} et tu as #{age} ans ton pseudo est #{id}"

  ##enregistrement des données##
  user_data = { first_name: first_name, last_name: last_name, city: city, age: age, id: id, password: password }
  users << user_data
  CSV.open(csv_file_path, 'w') do |csv|
    csv << users.first.keys 
    users.each do |user|
      csv << user.values 
    end
  end
end




#conection après inscription#
while connected==false
  puts "what is your pseudo?"
  id = gets.chomp
  puts "what is your password?"
  password = gets.chomp
  if users.any? { |user| user[:id] == id && user[:password] == password }
      puts "hello you are connected"
      connected=true
  else
     puts "pseudo or password is incorrect"
  end
end



##consultation##
if connected== true
  puts "veut tu me dire autre chose?"
answer = gets.chomp
##menu type developement##
if answer == "open"
    puts "Admin ID required"
    admin_id_verification = gets.chomp
    puts "Admin password required"
    admin_password_verification = gets.chomp
    if admins.any? { |admin| admin[:username] == admin_id_verification && admin[:password] == admin_password_verification }
      system("open #{csv_file_path}")    
    else
      puts "pseudo or password is incorrect"
    end
end
end