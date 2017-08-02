FactoryGirl.define do

  factory :user do
    id                    1
    name                  Faker::Name.name
    email                 Faker::Internet.email
    password              "11111111"
    password_comfirmation "11111111"
  end

end
