require 'random_data'

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

puts "#{Post.count}"
Post.find_or_create_by(title: "A unique Title", body: "A unique body")


puts "#{Comment.count}"
Comment.find_or_create_by(body: "Something unique")



puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
