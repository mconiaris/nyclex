require 'docx'
require 'pry'

# This takes in a Word Document and copies its data
# to a text document with additional tags for future
# splits.
def process_word_document
  # Create a Docx::Document object for our existing docx file
  doc = Docx::Document.open('resources/questions.docx')

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
    if p.to_s.include?("CARDIOVASCULAR\/CIRCULATORY SYSTEM") ||
      p.to_s.include?("GASTROINTESTINAL SYSTEM") ||
      p.to_s.include?("Basic Care and Comfort, Knowledge") ||
      p.to_s.include?("Basic Care and Comfort, knowledge, evaluation") ||
      p.to_s.include?("Health Promotion and Maintenance") ||
      p.to_s.include?("Management of Care, Application, Assessment") ||
      p.to_s.include?("Physiological Adaptation, Application") ||
      p.to_s.include?("Physiological Adaptation, Assessment, Application") ||
      p.to_s.include?("Physiological Adaptation, Knowledge") ||
      p.to_s.include?("Physiological adaptation, Application,") ||
      p.to_s.include?("Pharmacology, Application, Analysis") ||
      p.to_s.include?("Pharmacology, Application, Evaluation") ||
      p.to_s.include?("Pharmacology, Application, Implementation") ||
      p.to_s.include?("Pharmacology, Application, Planning") ||
      p.to_s.include?("Physiological adaptation, analysis, implementation") ||
      p.to_s.include?("Physiological adaptation, application,") ||
      p.to_s.include?("Physiological Integrity, Analysis,") ||
      p.to_s.include?("Physiological integrity, analysis, assessment") ||
      p.to_s.include?("Physiological Integrity, Application, Implementation") ||
      p.to_s.include?("Physiological integrity, Application, Implementation") ||
      p.to_s.include?("Reduction of risk") ||
      p.to_s.include?("Reduction of Risk") ||
      p.to_s.include?("Reduction of Risk, Application, Implementation") ||
      p.to_s.include?("Risk Reduction, Application,") ||
      p.to_s.include?("Safe and Effective Care, Implementation,") ||
      p.to_s.include?("Safe and effective care, Knowledge,")

    qt_file.puts(p.text)
    # Print questions without questions numbers to document
    # Have to manually add QBREAK to question 48 answer A.
    elsif p.to_s != ""
      qt_file.print(p.text)
      qt_file.print("QBREAK ")
    end
  end
  qt_file.close
end
