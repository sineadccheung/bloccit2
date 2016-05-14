require 'random_data'

# 15.times do
#   SponsoredPost.create!(
#   title: RandomData.random_sentence,
#   body: RandomData.random_paragraph,
#   )
# end
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all


5.times do
  User.create!(
  name: RandomData.random_name,
  email: RandomData.random_email,
  password: RandomData.random_sentence,
  )

end
users = User.all


50.times do
    post = Post.create!(
      user: users.sample,
      topic: topics.sample,
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
    )

    post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
# #13
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end

post = Post.all

100.times do
  Comment.create!(
    user: users.sample,
    post: post.sample,
    body: RandomData.random_paragraph
  )
end

# 15.times do
#   Topic.create!(
#     name: RandomData.random_sentence,
#     description: RandomData.random_paragraph
#   )
# end
#
# topics = Topic.all
#
# 50.times do
#   Post.create!(
#     user: users.sample,
#     topic: topics.sample,
#     title: RandomData.random_sentence,
#     body: RandomData.random_paragraph
#   )
# end

# 50.times do
#   SponsoredPost.create!(
#     topic: topics.sample,
#     title: RandomData.random_sentence,
#     body: RandomData.random_paragraph
#   )
# end

# user = User.first_name
#   user.update_attributes!(
#   email: 'sineadccheung@gmail.com',
#   password:'helloworld'
#   )

admin = User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "helloworld",
  role: "admin"
)

member = User.create!(
  name: "Member User",
  email: "member@example.com",
  password: "helloworld"
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
