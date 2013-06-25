FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :classified do
  	title "New advertisement"
    content "Lorem ipsum"
    email_address "new@mail.com"
    city "Chicago"
    address "9826 Jolly Drive"
    user
  end
end