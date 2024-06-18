require 'csv'



CSV.foreach("username.csv", headers: true, col_sep: ';') do |row|
    fname = row['First name']
    lname = row['Last name']  
    puts "FirstName: #{fname}, LastName: #{lname}"
end