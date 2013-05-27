FactoryGirl.define do
  factory :user do
    name     "John Smith"
    email    "smith@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end