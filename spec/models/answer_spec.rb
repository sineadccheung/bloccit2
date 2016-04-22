require 'rails_helper'

RSpec.describe Answer, type: :model do
    let(:questions) { Question.new(title: "New Question Title", body: "New Question Body", resolved: false) }
    let(:answers) { Answer.new(body: "New Answer Body") }

    it "has a body attribute" do
      expect(answers).to have_attributes(body: "New Answer Body")
    end
end
