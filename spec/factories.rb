FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person ##{n}" }
    sequence(:email) { |n| "person_#{n}@mail.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :category do
    sequence(:name)  { |n| "Category#{n}" }
  end

  factory :classified do
  	title "New advertisement2"
    content "Lorem ipsum2"
    email_address "newest@mail.com"
    city "New York"
    address "9826 Jolla Drive"
    category_id 1
    user
  end
end