require 'rails_helper'

RSpec.describe Answer, type: :model do
    let(:question) { Question.new(title: "New Question Title", body: "New Question Body", resolved: false) }
    let(:answer) { Answer.new(body: "New Answer Body", question_id: question) }

    it "has a body attribute" do
      expect(answer).to have_attributes(body: "New Answer Body")
    end
end
