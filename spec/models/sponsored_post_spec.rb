require 'rails_helper'
include RandomData

RSpec.describe SponsoredPost, type: :model do
  let(:sponsored_post) { SponsoredPost.create!(title: "New Sponsored Title", body: "New Sponsored Body")}
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }

  let(:topic) { Topic.create!(name: name, description: description)}
  let(:sponsored_post) { topic.sponsored_post.create!(title: title, body: body)}

  it { is_expected.to belong_to(:topic)}

  describe "attributes" do
    it "has title, body, and price attribtutes" do
      expect(sponsored_post).to have_attributes(title: title, body: body)

    end
  end
end
