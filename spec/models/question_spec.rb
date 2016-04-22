require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:questions) { Question.new(title: "New Question Title", body: "New Question Body", resolved: false)}

  describe "attributes" do
    it "has title and body attribtutes" do
        expect(questions).to have_attributes(title: "New Question Title", body: "New Question Body", resolved: false)
    end
  end
end
