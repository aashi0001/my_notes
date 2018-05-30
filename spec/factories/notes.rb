require 'faker'
FactoryGirl.define do
  factory :note do |n|
  	association :user, :factory => :user, :strategy => :build
  	n.id 1
    n.title Faker::HarryPotter.location
    n.etags [Faker::HarryPotter.house]
    n.content Faker::HarryPotter.quote
    n.status "active"
  end
end
