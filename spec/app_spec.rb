require "rspec"
require_relative "../lib/doc_to_array"




RSpec.describe Question do
  describe "#question_text" do
    it "returns 'Which of the following signs and symptoms would you monitor a patient for who has a decreased cardiac output?'" do
      question = Question.new({
        question_text: "Which of the following signs and symptoms would you monitor a patient for who has a decreased cardiac output?",
        choice_a:       "Urine output of 360 mL over last 12 hours.",
        choice_b:       "A clubbing appearance to upper extremities.",
        choice_c:       "A decreased sensation of tactile stimulation.",
        choice_d:       "A decrease in bilateral peripheral pulses.",
        choice_e:       "",
        choice_f:       "",
        correct_answer: "D",
        iggy:           "pg 862",
        rationale:      "Circulatory system involves the assessment of peripheral pulses which would relate to the cardiac output. Urine output of 30 mL/hr is normal, clubbing appearance involves the respiratory system, and tactile stimulation involves the nervous system.",
        subject:        "Reduction of risk, application, implementation",
        category:       "Cardiovascular/circulatory system (including operative)"
      })
    end
  end
end
