require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
  let(:post) {topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)}
  let(:user) { User.create!(name: "Bloccit user", email: "user@bloccit.com", password: "helloworld")}
  let(:comment) {Comment.create!(body: 'Comment Body', post: post, user: user)}

  it { is_expected.to belong_to(:post)}
  it { is_expected.to belong_to(:topic)}
  it { is_expected.to belong_to(:user)}

  it { is_expected.to validate_presence_of(:body)}
  it { is_expected.to validate_length_of(:body).is_at_least(5)}

  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: "Comment Body")
    end
  end

  describe "commenting" do
       it "allows the same comment to be associated with a different topic and post" do
         topic.comments << comment
         post.comments << comment

         topic_comment = topic.comment[0]
         post_comment = post.comment[0]
   # #11
         expect(topic_comment).to eql(post_comment)
       end
     end

end
