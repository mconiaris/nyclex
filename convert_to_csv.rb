require 'docx'
require 'pry'

# Create Array of Document Lines
text_line_array = Array.new

# Create Array of Questions
questions_array = Array.new



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

  # Retrieve and display paragraphs and add to csvquestions
  # TODO: Use Regex to look for numbers for new row
  doc.paragraphs.each do |p|
    # Merge paragraphs into questions_text.txt document
    if p.text != "" && p.text[0...5].scan(/(\d+\.)/)[0] != nil
      qt_file.print("\n")
      qt_file.print(p.text)
      qt_file.print("\t")
    elsif p.text == "Health Promotion and Maintenance, Application, Assessment" ||
      p.text == "Physiological Adaptation, Application, Assessment" ||
      p.text == "CARDIOVASCULAR/CIRCULATORY SYSTEM (INCLUDING OPERATIVE)" ||
      p.text == "Pharmacology, Application, Evaluation (Teaching)" ||
      p.text == "Reduction of Risk, Application, Assessment" ||
      # p.text == "Physiological Adaptation, Application, Intervention" ||
      p.text == "Pharmacology, Application, Planning" ||
      p.text.include?("Physiological Adaptation, Application, Intervention")
        qt_file.puts(p.text)
     elsif p.text == "GASTROINTESTINAL SYSTEM"
        qt_file.print("\n")
        qt_file.puts(p.text)
    elsif p.text != ""
      qt_file.print(p.text)
    end
  end
  puts qt_file.size
  q_file.puts("Testing")

    # binding.pry

  puts q_file.closed?
  q_file.close
  puts q_file.closed?

  puts qt_file.closed?
  qt_file.close
  puts qt_file.closed?
end

def process_text_file
  text_file = File.open('resources/questions_text.txt')
  text_file.readlines.each do |paragraph|
    if paragraph[0...5].scan(/(\d+\.)/)[0] != nil
      puts "There is a number here"
    else
      puts "There is no number here"
    end
    puts paragraph
    binding.pry
  end
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



# while(line = qt_file.gets)
#   puts "testing"
#   puts(line)
# end


#   i = 0
#   while i < text_line_array.size do
#     question = {
#       category:   text_line_array[0],
#       question:   text_line_array[i+1],
#       choice_A:   text_line_array[i+2],
#       choice_B:   text_line_array[i+3],
#       choice_C:   text_line_array[i+4],
#       choice_D:   text_line_array[i+5],
#       answer:     text_line_array[i+6],
#       iggy:       text_line_array[i+7],
#       rationale:  text_line_array[i+8],
#       subject:    text_line_array[i+9]
#     }

#     questions_array.push(question)
#     puts text_line_array[i]
#     i += 9
#   end

    # binding.pry

# # Retrieve and display paragraphs
# doc.paragraphs.each do |p|
#   # doc.paragraphs.first.text
#   # binding.pry
#   if p.text.include? "Rationale:"
#     puts p
#     puts "\n"
#   end
# end


# REGEX:
# (\d+\.)(.+)([A]\.)(.+)([B]\.)(.+)([C]\.)(.+)([D]\.)(.+)(Ans:|ANS:)(.[A-F]|[A-F])(Iggy:|.Iggy|Iggy)(.+)(Rationale:)(.+)(Health.+|Physiological.+)

process_word_document
process_text_file
