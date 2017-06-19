FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "first_name#{n}" }
    sequence(:last_name) { |n| "last_name#{n}" }
    sequence(:email) { |n| "email#{n}@example.com" }
    password 'password'
    encrypted_password 'encrypted_password'
  end
end
