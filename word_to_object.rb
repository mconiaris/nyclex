require_relative 'question'
require 'docx'
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

  category = ""

  questions_array.each do |cell|

    case cell
    when /CARDIOVASCULAR\/CIRCULATORY/
      category = cell.capitalize
    when /GASTROINTESTINAL SYSTEM/
      category = cell.capitalize
    end

    @ruby_questions_array.push(category)

  end
# question_number, :question_text,
#     :choice_a, :choice_b, :choice_c, :choice_d,
#     :choice_e, :choice_f, :correct_answer, :iggy,
#     :rationale, :subject, :category
  puts @ruby_questions_array.size
end

text_to_ruby_objects(word_doc_to_array)
binding.pry
