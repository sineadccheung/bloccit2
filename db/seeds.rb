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
    Post.create!(
      user: users.sample,
      topic: topics.sample,
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
    )
end

post = Post.all

100.times do
  Comment.create!(
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

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} sponsored posts created"
