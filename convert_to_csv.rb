require 'docx'
require 'pry'

# Create a Docx::Document object for our existing docx file
doc = Docx::Document.open('resources/questions.docx')

# Create or open stream to questions.txt document
if File.exist?('resources/csvquestions.txt') == false
  q_file = File.new('resources/csvquestions.txt', 'w+')
  puts 'Created csvquestions.txt'
else
  q_file = File.open('resources/csvquestions.txt', 'w+')
  puts 'Opened csvquestions.txt'
end

# binding.pry

# Retrieve and display paragraphs and add to csvquestions
# TODO: Detect line break and use for csv
# TODO: Use Regex to look for numbers for new row
doc.paragraphs.each do |p|
  q_file.puts(p)
end


# Retrieve and display paragraphs
doc.paragraphs.each do |p|
  # doc.paragraphs.first.text
  if p.text.include? "Rationale:"
    puts p
    puts "\n"
  end
end

q_file.puts("Testing")

  # binding.pry

puts q_file.closed?
q_file.close
puts q_file.closed?
