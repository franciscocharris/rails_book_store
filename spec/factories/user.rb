FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.middle_name }
    Date_birth { Faker::Date.in_date_period(month: 2) }
    email { Faker::Internet.email }
    password { '12345678' }
  end

  trait :custom_email do
    email { 'user@gmail.com' }
  end
end