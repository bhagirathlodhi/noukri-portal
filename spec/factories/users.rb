FactoryBot.define do
  factory :user do
    name {Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    password { "password123" }
    dob { "23-03-2010" }
    admin { false }
  end
end
