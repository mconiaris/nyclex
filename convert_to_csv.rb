require 'docx'
require 'pry'

# Create a Docx::Document object for our existing docx file
doc = Docx::Document.open('resources/questions.docx')

# Create or open stream to questions.txt document
if File.exist?('resources/csvquestions.txt') == false
  q_file = File.new('resources/csvquestions.txt')
  puts 'Created csvquestions.txt'
else
  q_file = File.open('resources/csvquestions.txt')
  puts 'Opened csvquestions.txt'
end

binding.pry

# Retrieve and display paragraphs
doc.paragraphs.each do |p|
  puts p
end


# Retrieve and display paragraphs
doc.paragraphs.each do |p|
  # doc.paragraphs.first.text
  if p.text.include? "Rationale:"
    puts p
    puts "\n"
  end
end

  binding.pry
puts doc.paragraphs.first

File.close('resources/csvquestions.txt')
