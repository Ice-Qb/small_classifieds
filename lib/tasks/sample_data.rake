namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do |n|
      title         = "Title #{n}"
      content       = Faker::Lorem.sentence(5)
      email_address = "email#{n}@address.com"
      city          = "city #{n}"
      address       = "address #{n}"  
      users.each { |user| user.classifieds.create!(
        title: title, content: content, email_address: email_address, 
        city: city, address: address) }
    end
  end
end