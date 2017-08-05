FactoryGirl.define do
  pass = Faker::Internet.password(8)
  factory :user do
    id                    1
    name                  Faker::Name.name
    email                 Faker::Internet.email
    password              pass
    password_confirmation pass
  end

end
