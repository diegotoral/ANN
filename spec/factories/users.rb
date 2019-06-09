FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password { '1q2w3e4r' }
    password_confirmation { '1q2w3e4r' }
  end
end
