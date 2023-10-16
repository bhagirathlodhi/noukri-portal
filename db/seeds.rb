# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
User.create!(name: "Example", email: "example@gmail.com", password: "123456", password_confirmation: "123456", dob: 12/02/2002, admin: true)
User.create!(name: "Virat", email: "virat@gmail.com", password: "123456", password_confirmation: "123456", dob: 12/02/2002, admin: true)
User.create!(name: "msd", email: "msd@gmail.com", password: "123456", password_confirmation: "123456", dob: 12/02/2002, admin: true)



User.all.each do |user|
  50.times do |i|
    user.jobs.create!(
      title: "Developer #{i + 1} for #{user.name}",
      experience: "must have  #{i + 1} experience for this job",
      salary: "35000",
      location: "Indore",
      skills: "Java, SQL, HTML, CSS, ReactJS, Javascript",
      description: "In a Ruby on Rails application, you can create seed data for a Job model
                    that belongs to a particular User by using Rails' built-in seed functionality. Seed data
                    allows you to populate your database with initial data that can be used for testing and development. 
                    To create seed data for a job that belongs to a user, follow these steps:In a Ruby on Rails application, you can 
                    create seed data for a Job model that belongs to a particular User by using Rails' built-in seed functionality. 
                    Seed data allows you to populate your database with initial data that can be used for testing and development.
                    To create seed data for a job that belongs to a user, follow these steps:In a Ruby on Rails application, 
                    you can create seed data for a Job model that belongs to a particular User by using Rails' built-in seed functionality.
                    Seed data allows you to populate your database with initial data that can be used for testing and development.
                    To create seed data for a job that belongs to a user, follow these steps:",
      vacancy: 23
    )
  end
end
