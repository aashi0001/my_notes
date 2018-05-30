require 'faker'
Note.delete_all
User.delete_all
test_user = User.create( email: 'test_user@example.com', password: '12345678')
test_user_two = User.create( email: 'test_user_two@example.com', password: '87654321')

3.times do
   Note.create( title: Faker::HarryPotter.location, etags: [Faker::HarryPotter.house], content: Faker::HarryPotter.quote, status: 1, user: test_user)
end

3.times do
   Note.create( title: Faker::HarryPotter.location, etags: [Faker::HarryPotter.house], content: Faker::HarryPotter.quote, status: 1, user: test_user_two)
end