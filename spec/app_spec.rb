require "rspec"
require_relative "../lib/doc_to_array"




RSpec.describe Question do
  describe "#question_text" do
    it "returns 'Which of the following signs?'" do
      question = Question.new({
        question_text: "Which of the following signs?",
        choice_a:       "Urine output.",
        choice_b:       "A clubbing appearance.",
        choice_c:       "A decreased sensation.",
        choice_d:       "A decrease in bilateral.",
        choice_e:       "",
        choice_f:       "",
        correct_answer: "D",
        iggy:           "pg 862",
        rationale:      "Circulatory system involves.",
        subject:        "Reduction of risk",
        category:       "Cardiovascular/circulatory"
      })
    end
  end
end
