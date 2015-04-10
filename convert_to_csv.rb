require 'docx'
require 'pry'

# Create Array of Document Lines
text_line_array = Array.new

# Create Array of Questions
questions_array = Array.new

# Create a Docx::Document object for our existing docx file
doc = Docx::Document.open('resources/questions.docx')


# Create or open stream to questions.txt document
if File.exist?('resources/csvquestions.csv') == false
  q_file = File.new('resources/csvquestions.csv', 'w+')
  puts 'Created csvquestions.csv'
else
  q_file = File.open('resources/csvquestions.csv', 'w+')
  puts 'Opened csvquestions.csv'
end


# Retrieve and display paragraphs and add to csvquestions
# TODO: Use Regex to look for numbers for new row
doc.paragraphs.each do |p|
#   # TODO: Replace newlines with commas
#   if p.text != ""
#     # Create Hash for each question
#     # Look for paragraphs that being with numbers
#     if p.text.scan(/(\d+\.)/)[0] != nil
#       question_hash = Hash.new
#       question_hash = { question: p.text }
#       # q_file.print("\n")
#     binding.pry
#     else
#       question_hash = { misc: p.text }
#     end


#     # q_file.print(p)
#     q_file.print(p)
#     # q_file.print(',')
#   end

  # Take Document Text and Insert it into an Array
  if p.text != ""
    text_line_array.push(p.text)
  end
end

  i = 0
# binding.pry
  while i < text_line_array.size do
    question = {
      category:   text_line_array[0],
      question:   text_line_array[i+1],
      choice_A:   text_line_array[i+2],
      choice_B:   text_line_array[i+3],
      choice_C:   text_line_array[i+4],
      choice_D:   text_line_array[i+5],
      answer:     text_line_array[i+6],
      iggy:       text_line_array[i+7],
      rationale:  text_line_array[i+8],
      subject:    text_line_array[i+9]
    }

    questions_array.push(question)
    puts text_line_array[i]
    i += 9
  end

    binding.pry

# # Retrieve and display paragraphs
# doc.paragraphs.each do |p|
#   # doc.paragraphs.first.text
#   # binding.pry
#   if p.text.include? "Rationale:"
#     puts p
#     puts "\n"
#   end
# end

q_file.puts("Testing")

  # binding.pry

puts q_file.closed?
q_file.close
puts q_file.closed?
