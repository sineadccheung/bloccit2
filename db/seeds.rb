require 'random_data'

15.times do
  SponsoredPost.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  )
end


50.times do
    Post.create!(
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

15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all

50.times do
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

50.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponoredPost.count} sponsored posts created"
