User.create!(
  email: 'admin@ya.com',
  password: '123123',
  password_confirmation: '123123'
)

30.times do
  Course.create!(
    [{
       title: Faker::Educator.course_name,
       description: Faker::TvShows::GameOfThrones.quote,
       user_id: User.first.id
     }]
  )
end