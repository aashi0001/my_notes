require 'faker'
FactoryGirl.define do
  factory :user do |u|
  	u.id 1
    u.email Faker::Internet.email
    u.password Faker::Internet.password(min_length = 6, max_length = 16)
  end
end
