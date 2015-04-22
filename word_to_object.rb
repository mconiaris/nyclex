require_relative 'question'

require 'pry'

@ruby_questions_array  = Array.new

def word_doc_to_array

  # Create Array of Document Lines
  doc_line_array = Array.new

  # Create a Docx::Document object for our existing docx file
  doc = Docx::Document.open('resources/questions.docx')

  # Retrieve and display paragraphs and add to questions_text.txt
  doc.paragraphs.each do |p|

    if p.to_s != ""
      doc_line_array.push(p.to_s)
    end
  end
  return doc_line_array
end


def text_to_ruby_objects(array)

  questions_array = array

  questions_line_array = Array.new

  category = ""

  questions_array.each do |cell|

    if cell == "CARDIOVASCULAR/CIRCULATORY SYSTEM (INCLUDING OPERATIVE)" ||
            cell == "GASTROINTESTINAL SYSTEM"
      category = cell.capitalize
      questions_line_array.push(category)
    elsif cell.downcase.include?("rationale")
      questions_line_array.push(cell)
      @ruby_questions_array.push(questions_line_array)
      binding.pry
    end
    questions_line_array.clear


    # if cell == "Reduction of risk, application, implementation" ||
    #       cell == "Health Promotion and Maintenance, application, implementation (Teaching)"

    #   @ruby_questions_array.push(questions_line_array)
    # end

    # if cell != "Health Promotion and Maintenance, Application, Assessment" ||
    #     cell != "Physiological Adaptation, Application, Assessment" ||
    #     cell != "CARDIOVASCULAR/CIRCULATORY SYSTEM (INCLUDING OPERATIVE)" ||
    #     cell != "Pharmacology, Application, Evaluation (Teaching)" ||
    #     cell != "Reduction of risk, application, implementation" ||
    #     cell != "Pharmacology, Application, Planning" ||
    #     cell != "Physiological integrity, analysis, assessment"
    #     cell != "Physiological integrity, Application, Implementation (teaching/learning)"
    #     cell.include?("Physiological Adaptation, Application, Intervention")
    #   questions_line_array.push(cell)
    # else
    #   puts cell
    #   questions_line_array.push(cell)
    #   @ruby_questions_array.push(questions_line_array)
    #   questions_line_array = Array.new
    # end
  end
# question_number, :question_text,
#     :choice_a, :choice_b, :choice_c, :choice_d,
#     :choice_e, :choice_f, :correct_answer, :iggy,
#     :rationale, :subject, :category
  puts @ruby_questions_array.size
      binding.pry
end

text_to_ruby_objects(word_doc_to_array)
