require_relative 'question'
require 'docx'
require 'pry'


def word_doc_to_array

  # Create Array of Document Lines
  doc_line_array = Array.new
# question_number, :question_text,
#     :choice_a, :choice_b, :choice_c, :choice_d,
#     :choice_e, :choice_f, :correct_answer, :iggy,
#     :rationale, :subject, :category

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

word_doc_to_array
puts word_doc_to_array.size
# binding.pry
puts "hi"
