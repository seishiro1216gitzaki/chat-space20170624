FactoryGirl.define do

  factory :message do
    id  Faker::Number.digit
    body                 Faker::Lorem.sentence
    image                Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/GOPR0209.JPG'))
    user_id              1
    group_id             1
  end

end
