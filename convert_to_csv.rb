require 'docx'
require 'pry'

# Create a Docx::Document object for our existing docx file
doc = Docx::Document.open('resources/questions.docx')

# binding.pry

# Retrieve and display paragraphs
doc.paragraphs.each do |p|
  puts p
end

# Retrieve and display paragraphs
doc.paragraphs.each do |p|
  if doc.to_s.include? "Rationale"
    binding.pry
    puts p
  end
end
