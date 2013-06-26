namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@mail.ua",
                         password: "foobar",
                         password_confirmation: "foobar"
                         )
    admin.toggle!(:admin)
    33.times do |n|
      name  = Faker::Name.name
      email = "example#{n+1}@mail.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 5)
    names = ["Cars", "Electronics", "Clothing", "Antiques", "Pets"]
    names.each do |name|
      Category.create!(name: name)
    end

    n = 0
    
    50.times do 
      users.each do |user|
        title         = "Title ##{n}"
        content       = Faker::Lorem.sentence(5)
        email_address = "my_email_#{n}@address.com"
        city          = "city ##{n}"
        address       = "address ##{n}"
        category_id   = 1 + rand(5)
        user.classifieds.create!(
          title: title, content: content, email_address: email_address, 
          city: city, address: address, category_id: category_id)
        n += 1
      end
    end
  end
end