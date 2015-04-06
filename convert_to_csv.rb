require 'docx'
require 'pry'

# Create a Docx::Document object for our existing docx file
doc = Docx::Document.open('resources/questions.docx')


# Retrieve and display paragraphs
doc.paragraphs.each do |p|
  puts p
end


# Retrieve and display paragraphs
doc.paragraphs.each do |p|
    # doc.paragraphs.first.text
      # binding.pry
    if p.text.include? "Rationale:"
      puts p
      puts "\n"
    end
end
