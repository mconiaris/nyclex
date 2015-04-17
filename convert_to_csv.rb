require_relative 'question'
require 'docx'
require 'pry'

# Create Array of Document Lines
text_line_array = Array.new




def process_word_document
  # Create a Docx::Document object for our existing docx file
  doc = Docx::Document.open('resources/questions.docx')

  # binding.pry

  # Create or open stream to csvquestions.csv document
  if File.exist?('resources/csvquestions.csv') == false
    q_file = File.new('resources/csvquestions.csv', 'w+')
    puts 'Created csvquestions.csv'
  else
    q_file = File.open('resources/csvquestions.csv', 'w+')
    puts 'Opened csvquestions.csv'
  end

  # Create or open stream to questions_text.txt document
  if File.exist?('resources/questions_text.txt') == false
    qt_file = File.new('resources/questions_text.txt', 'w+')
    puts 'Created questions_text.txt'
  else
    qt_file = File.open('resources/questions_text.txt', 'w+')
    puts 'Opened questions_text.txt'
  end

  # Retrieve and display paragraphs and add to questions_text.txt
  doc.paragraphs.each do |p|
    # Merge paragraphs into questions_text.txt document
    # Each newline contains a question and related text
    # Search for question numbers in first six characters
    if p.text != "" && p.text[0...5].scan(/(\d+\.)/)[0] != nil
      qt_file.print("\n")
      qt_file.print(p.text)
      qt_file.print(" ")
    # Add line break after subjects to capture questions
    # that do not have line numbers
    elsif p.text == "Health Promotion and Maintenance, Application, Assessment" ||
      p.text == "Physiological Adaptation, Application, Assessment" ||
      p.text == "CARDIOVASCULAR/CIRCULATORY SYSTEM (INCLUDING OPERATIVE)" ||
      p.text == "Pharmacology, Application, Evaluation (Teaching)" ||
      p.text == "Reduction of Risk, Application, Assessment" ||
      p.text == "Pharmacology, Application, Planning" ||
      p.text.include?("Physiological Adaptation, Application, Intervention")
        qt_file.puts(p.text)
      # Add line break for this category
     elsif p.text == "GASTROINTESTINAL SYSTEM"
        qt_file.print("\n")
        qt_file.puts(p.text)
    # Print questions without questions numbers to document
    elsif p.text != ""
      binding.pry
      qt_file.print(p.text)
      qt_file.print(" ")
    end
  end
  # Add test text to ensure that file can be written to
  q_file.puts("Testing")

  # Close documents
  q_file.close
  qt_file.close
end

# Take text from questions_text.txt and create Ruby objects
def process_text_file
  # Create Array of Questions
  questions_array = Array.new

  # To be overwritten with REGEX scans
  category = ""

  # Open questions_text document
  text_file = File.open('resources/questions_text.txt')

  # Read each line of the document to create Ruby objects
  text_file.readlines.each do |paragraph|
    # Look for text to change category variable
    if paragraph.include?("CARDIOVASCULAR/CIRCULATORY SYSTEM")
      category = paragraph.chomp.capitalize
    elsif paragraph.include?("GASTROINTESTINAL SYSTEM")
      category = paragraph.chomp.capitalize

    # Look for text with question numbers on it
    # and capture relevant info using REGEX
    elsif paragraph[0...5].scan(/(\d+\.)/)[0] != nil
      parsed_paragraph = paragraph.scan(/(\d+\.)(.+)([A]\.)(.+)([B]\.)(.+)([C]\.)(.+)([D]\.)(.+)(Ans:|ANS:)/)

      correct_answer_scan = paragraph.scan(/(Ans:|ANS:)(.[[A-G],* ]+|[[A-G],* ]+)/)
      correct_answer_text = correct_answer_scan[0][1]

      # Had to add "pg 0" to Iggy on Question 13
      iggy_text_scan = paragraph.scan(/(Iggy:|.Iggy|Iggy)\s(\w+\.*:?\s*\d+\-?,?\/?\s?\d*)/)
      iggy_text = iggy_text_scan[0][1]

      rationale_scan = paragraph.scan(/(Rationale:)\s(.+)(Reduction|Health|Physiological|Basic|Pharmacology|Risk|Safe)/)
      rationale_text = rationale_scan[0][1]

      subject_scan = paragraph.scan(/(Reduction.+|Health.+|Physiological.+|Basic.+|Pharmacology.+|Risk.+|Safe.+)/)
      subject_text = subject_scan[0][0]

# Iggy: (Iggy:|.Iggy|Iggy)\s(\w+\.*:?\s*\d+\-?,?\/?\s?\d*)

      question_object = Question.new(
        question_number:  parsed_paragraph[0][0],
        question_text:    parsed_paragraph[0][1],
        choice_a:         parsed_paragraph[0][3],
        choice_b:         parsed_paragraph[0][5],
        choice_c:         parsed_paragraph[0][7],
        choice_d:         parsed_paragraph[0][9],
        correct_answer:   correct_answer_text,
        iggy:             iggy_text,
        rationale:        rationale_text,
        subject:          subject_text,
        category:         category
        )
      questions_array.push(question_object)
    elsif paragraph != "\n"
      questions_array.push(paragraph)
      puts "There is no number here"
    end
    puts paragraph
  end
    binding.pry
  text_file_text = text_file.read

  # Look for paragraphs that fit into working REGEX
  if text_file_text.scan(/(\d+\.)(.+)([A]\.)(.+)([B]\.)(.+)([C]\.)(.+)([D]\.)(.+)(Ans:|ANS:)/)
    text = text_file_text.scan(/(\d+\.)(.+)([A]\.)(.+)([B]\.)(.+)([C]\.)(.+)([D]\.)(.+)(Ans:|ANS:)/)
    puts "if statement triggered"
  end


  text = text_file_text.scan(/(\d+\.)(.+)([A]\.)(.+)([B]\.)(.+)([C]\.)(.+)([D]\.)(.+)(Ans:|ANS:)(.[A-F]|[A-F])(Iggy:|.Iggy|Iggy)(.+)(Rationale:)(.+)(Health.+|Physiological.+)/)
  # binding.pry
  puts "inside process text file"
  text_file.close
end

process_word_document
process_text_file


# require_relative 'question'
# require 'docx'
# require 'pry'

# # Create Array of Document Lines
# text_line_array = Array.new




# def process_word_document
#   # Create a Docx::Document object for our existing docx file
#   doc = Docx::Document.open('resources/questions.docx')

#   # binding.pry

#   # Create or open stream to csvquestions.csv document
#   if File.exist?('resources/csvquestions.csv') == false
#     q_file = File.new('resources/csvquestions.csv', 'w+')
#     puts 'Created csvquestions.csv'
#   else
#     q_file = File.open('resources/csvquestions.csv', 'w+')
#     puts 'Opened csvquestions.csv'
#   end

#   # Create or open stream to questions_text.txt document
#   if File.exist?('resources/questions_text.txt') == false
#     qt_file = File.new('resources/questions_text.txt', 'w+')
#     puts 'Created questions_text.txt'
#   else
#     qt_file = File.open('resources/questions_text.txt', 'w+')
#     puts 'Opened questions_text.txt'
#   end

#   # Retrieve and display paragraphs and add to questions_text.txt
#   doc.paragraphs.each do |p|
#     # Merge paragraphs into questions_text.txt document
#     # Each newline contains a question and related text
#     # Search for question numbers in first six characters
#     if p.text != "" && p.text[0...5].scan(/(\d+\.)/)[0] != nil
#       qt_file.print("\n")
#       qt_file.print(p.text)
#       qt_file.print(" ")
#     # Add line break after subjects to capture questions
#     # that do not have line numbers
#     elsif p.text == "Health Promotion and Maintenance, Application, Assessment" ||
#       p.text == "Physiological Adaptation, Application, Assessment" ||
#       p.text == "CARDIOVASCULAR/CIRCULATORY SYSTEM (INCLUDING OPERATIVE)" ||
#       p.text == "Pharmacology, Application, Evaluation (Teaching)" ||
#       p.text == "Reduction of Risk, Application, Assessment" ||
#       p.text == "Pharmacology, Application, Planning" ||
#       p.text.include?("Physiological Adaptation, Application, Intervention")
#         qt_file.puts(p.text)
#       # Add line break for this category
#      elsif p.text == "GASTROINTESTINAL SYSTEM"
#         qt_file.print("\n")
#         qt_file.puts(p.text)
#     # Print questions without questions numbers to document
#     elsif p.text != ""
#       binding.pry
#       qt_file.print(p.text)
#       qt_file.print(" ")
#     end
#   end
#   # Add test text to ensure that file can be written to
#   q_file.puts("Testing")

#   # Close documents
#   q_file.close
#   qt_file.close
# end

# # Take text from questions_text.txt and create Ruby objects
# def process_text_file
#   # Create Array of Questions
#   questions_array = Array.new

#   # To be overwritten with REGEX scans
#   category = ""

#   # Open questions_text document
#   text_file = File.open('resources/questions_text.txt')

#   # Read each line of the document to create Ruby objects
#   text_file.readlines.each do |paragraph|
#     # Look for text to change category variable
#     if paragraph.include?("CARDIOVASCULAR/CIRCULATORY SYSTEM")
#       category = paragraph.chomp.capitalize
#     elsif paragraph.include?("GASTROINTESTINAL SYSTEM")
#       category = paragraph.chomp.capitalize

#     # Look for text with question numbers on it
#     # and capture relevant info using REGEX
#     elsif paragraph[0...5].scan(/(\d+\.)/)[0] != nil
#       parsed_paragraph = paragraph.scan(/(\d+\.)(.+)([A]\.)(.+)([B]\.)(.+)([C]\.)(.+)([D]\.)(.+)(Ans:|ANS:)/)

#       correct_answer_scan = paragraph.scan(/(Ans:|ANS:)(.[[A-G],* ]+|[[A-G],* ]+)/)
#       correct_answer_text = correct_answer_scan[0][1]

#       # Had to add "pg 0" to Iggy on Question 13
#       iggy_text_scan = paragraph.scan(/(Iggy:|.Iggy|Iggy)\s(\w+\.*:?\s*\d+\-?,?\/?\s?\d*)/)
#       iggy_text = iggy_text_scan[0][1]

#       rationale_scan = paragraph.scan(/(Rationale:)\s(.+)(Reduction|Health|Physiological|Basic|Pharmacology|Risk|Safe)/)
#       rationale_text = rationale_scan[0][1]

#       subject_scan = paragraph.scan(/(Reduction.+|Health.+|Physiological.+|Basic.+|Pharmacology.+|Risk.+|Safe.+)/)
#       subject_text = subject_scan[0][0]

# # Iggy: (Iggy:|.Iggy|Iggy)\s(\w+\.*:?\s*\d+\-?,?\/?\s?\d*)

#       question_object = Question.new(
#         question_number:  parsed_paragraph[0][0],
#         question_text:    parsed_paragraph[0][1],
#         choice_a:         parsed_paragraph[0][3],
#         choice_b:         parsed_paragraph[0][5],
#         choice_c:         parsed_paragraph[0][7],
#         choice_d:         parsed_paragraph[0][9],
#         correct_answer:   correct_answer_text,
#         iggy:             iggy_text,
#         rationale:        rationale_text,
#         subject:          subject_text,
#         category:         category
#         )
#       questions_array.push(question_object)
#     elsif paragraph != "\n"
#       questions_array.push(paragraph)
#       puts "There is no number here"
#     end
#     puts paragraph
#   end
#     binding.pry
#   text_file_text = text_file.read

#   # Look for paragraphs that fit into working REGEX
#   if text_file_text.scan(/(\d+\.)(.+)([A]\.)(.+)([B]\.)(.+)([C]\.)(.+)([D]\.)(.+)(Ans:|ANS:)/)
#     text = text_file_text.scan(/(\d+\.)(.+)([A]\.)(.+)([B]\.)(.+)([C]\.)(.+)([D]\.)(.+)(Ans:|ANS:)/)
#     puts "if statement triggered"
#   end


#   text = text_file_text.scan(/(\d+\.)(.+)([A]\.)(.+)([B]\.)(.+)([C]\.)(.+)([D]\.)(.+)(Ans:|ANS:)(.[A-F]|[A-F])(Iggy:|.Iggy|Iggy)(.+)(Rationale:)(.+)(Health.+|Physiological.+)/)
#   # binding.pry
#   puts "inside process text file"
#   text_file.close
# end



# # while(line = qt_file.gets)
# #   puts "testing"
# #   puts(line)
# # end


# #   i = 0
# #   while i < text_line_array.size do
# #     question = {
# #       category:   text_line_array[0],
# #       question:   text_line_array[i+1],
# #       choice_A:   text_line_array[i+2],
# #       choice_B:   text_line_array[i+3],
# #       choice_C:   text_line_array[i+4],
# #       choice_D:   text_line_array[i+5],
# #       answer:     text_line_array[i+6],
# #       iggy:       text_line_array[i+7],
# #       rationale:  text_line_array[i+8],
# #       subject:    text_line_array[i+9]
# #     }

# #     questions_array.push(question)
# #     puts text_line_array[i]
# #     i += 9
# #   end

#     # binding.pry

# # # Retrieve and display paragraphs
# # doc.paragraphs.each do |p|
# #   # doc.paragraphs.first.text
# #   # binding.pry
# #   if p.text.include? "Rationale:"
# #     puts p
# #     puts "\n"
# #   end
# # end


# # REGEX:
# # (\d+\.)(.+)([A]\.)(.+)([B]\.)(.+)([C]\.)(.+)([D]\.)(.+)(Ans:|ANS:)(.[A-F]|[A-F])(Iggy:|.Iggy|Iggy)(.+)(Rationale:)(.+)(Health.+|Physiological.+)

# process_word_document
# process_text_file
