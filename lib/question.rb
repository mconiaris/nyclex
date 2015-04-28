require 'json'

class Question

  attr_accessor :question_text,
    :choice_a, :choice_b, :choice_c, :choice_d,
    :choice_e, :choice_f, :correct_answer, :iggy,
    :rationale, :subject, :category

    # Had to add a space in question number 38 next to ANS

  def initialize(args)
    @question_text    = args[:question_text]
    @choice_a         = args[:choice_a]
    @choice_b         = args[:choice_b]
    @choice_c         = args[:choice_c]
    @choice_d         = args[:choice_d]
    @choice_e         = args[:choice_e] ||= ""
    @choice_f         = args[:choice_f] ||= ""
    @correct_answer   = args[:correct_answer]
    @iggy             = args[:iggy]
    @rationale        = args[:rationale]
    @subject          = args[:subject]
    @category         = args[:category]
  end

  # Takes Ruby objects and puts them into json form
  def to_json
    {
        "json_class"  =>  self.class.name,
        "data"        =>  {

          "question_text"     =>  question_text,
          "choice_a"          =>  choice_a,
          "choice_b"          =>  choice_b,
          "choice_c"          =>  choice_c,
          "choice_d"          =>  choice_d,
          "choice_e"          =>  choice_e,
          "choice_f"          =>  choice_f,
          "correct_answer"    =>  correct_answer,
          "iggy"              =>  iggy,
          "rationale"         =>  rationale,
          "subject"           =>  subject,
          "category"          =>  category
          }

    }.to_json

  end
end
