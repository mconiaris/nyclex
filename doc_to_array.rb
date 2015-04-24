require_relative 'process_word_document'
require_relative 'question_category'
require_relative 'question'
require 'docx'
require 'pry'


# Create Array of Document Lines
text_line_array = Array.new


# Take text from questions_text.txt and create
# Ruby objects
def process_text_file
  # Create Array of Questions
  questions_array = Array.new

  # Open questions_text document
  text_file = File.open('resources/questions_text.txt')

  # Read each line of the document to create Ruby objects
  text_file.readlines.each do |paragraph|

    questions_array.push(paragraph)

  end
end

def normalize_question_text(text)

  text.split(/\d+\.\s?(.+)/)[1].rstrip

end



# This message takes out all of the spacing quirks and
# odd characters that make the document less useful.
def normalize_object_text(array)

  object_array = array

  object_array.each do |cell|
    # If question text has a number in it, remove it
    if cell.question_text[0...4].match(/\d+\.\s?(.+)/)
      cell.question_text =
        normalize_question_text(cell.question_text)
    end

    # Removes the "A." from choice_a text.
    if !cell.choice_a.nil? && cell.choice_a[0...3].include?("A.")
      cell.choice_a =
        cell.choice_a.split(/[A]\.(.+)/)[1].strip
    elsif !cell.choice_a.nil?
      cell.choice_a = cell.choice_a.strip
    end

    # Removes the "B." from choice_b text.
    if !cell.choice_b.nil? && cell.choice_b[0...4].include?("B.")
      cell.choice_b =
        cell.choice_b.split(/[B]\.(.+)/)[1].strip
    elsif !cell.choice_b.nil?
      cell.choice_b = cell.choice_b.strip
    end

    # Removes the "C." from choice_c text.
    if !cell.choice_c.nil? && cell.choice_c[0...4].include?("C.")
      cell.choice_c =
        cell.choice_c.split(/[C]\.(.+)/)[1].strip
    elsif !cell.choice_c.nil?
      cell.choice_c = cell.choice_c.strip
    end

    # Removes the "D." from choice_d text.
    if !cell.choice_d.nil? && cell.choice_d[0...4].include?("D.")
      cell.choice_d =
        cell.choice_d.split(/[D]\.(.+)/)[1].strip
    elsif !cell.choice_d.nil?
      cell.choice_d = cell.choice_d.strip
    end

    # Removes the "E." from choice_e text.
    if !cell.choice_e.nil? && cell.choice_e[0...4].include?("E.")
      cell.choice_e =
        cell.choice_e.split(/[E]\.(.+)/)[1].strip
    elsif !cell.choice_e.nil?
      cell.choice_e = cell.choice_e.strip
    end

    # Removes the "F." from choice_f text.
    if !cell.choice_f.nil? && cell.choice_f[0...4].include?("F.")
      cell.choice_f =
        cell.choice_f.split(/[F]\.(.+)/)[1].strip
    elsif !cell.choice_f.nil?
      cell.choice_f = cell.choice_f.strip
    end

    # Removes the "Ans." from correct_answer text.
    if !cell.correct_answer.nil? &&
        (cell.correct_answer[0...5].include?("Ans:") ||
          cell.correct_answer[0...5].include?("ANS:") )

      cell.correct_answer =
        cell.correct_answer.split(/(Ans:|ANS:)(.[[A-G],* ]+|[[A-G],* ]+)/)[2].strip
    elsif !cell.correct_answer.nil?
      cell.correct_answer = cell.correct_answer.strip
    end

    # Removes the "Iggy." from iggy text.
    if !cell.iggy.nil? && cell.iggy.include?("ggy")
      cell.iggy =
        cell.iggy.split(/(Iggy:|.Iggy|Iggy)\s(\w+\.*:?\s*\d+\-?,?\/?\s?\d*)/)[2].strip
    elsif !cell.iggy.nil?
      cell.iggy = cell.iggy.strip
    end

    # Removes the "rationale" from rationale text.
    if !cell.rationale.nil? && cell.rationale.include?("Rationale")
      cell.rationale =
        cell.rationale.split(/(Rationale:)\s(.+)/)[2].strip
    elsif !cell.rationale.nil?
      cell.rationale = cell.rationale.strip
    end
  end
end

# Takes Ruby objects and puts them into text form
def persist_objects(array)
  object_array = array

  # Calls normalize_object_text method
  # to clean up text and make it uniform
  normalize_object_text(object_array)

  # Create or open stream to jsonquestions.txt document
  if File.exist?('resources/jsonquestions.txt') == false
    q_file = File.new('resources/jsonquestions.txt', 'w+')
    puts 'Created jsonquestions.txt'
  else
    q_file = File.open('resources/jsonquestions.txt', 'w+')
    puts 'Opened jsonquestions.txt'
  end

  # Add Array Content to Text File
  # in json format
  object_array.each do |cell|

    q_file.puts(cell.to_json)

  end
  # Close documents
  q_file.close
end

# Takes Ruby objects and puts them into text form
def test_normalization(array)
  object_array = array

  # Calls normalize_object_text method
  # to clean up text and make it uniform
  normalize_object_text(object_array)

  # Create or open stream to jsonquestions.txt document
  if File.exist?('resources/jsonquestions.txt') == false
    q_file = File.new('resources/jsonquestions.txt', 'w+')
    puts 'Created jsonquestions.txt'
  else
    q_file = File.open('resources/jsonquestions.txt', 'w+')
    puts 'Opened jsonquestions.txt'
  end

  # Add Array Content to Text File
  object_array.each do |cell|

    q_file.puts(cell.question_text)
    q_file.puts(cell.choice_a)
    q_file.puts(cell.choice_b)
    q_file.puts(cell.choice_c)
    q_file.puts(cell.choice_d)

    # Not every question object has a choice e
    if cell.choice_e != ""
      q_file.puts(cell.choice_e)
    end

    # Not every question object has a choice f
    if cell.choice_f != ""
      q_file.puts(cell.choice_f)
    end

    q_file.puts(cell.correct_answer)
    q_file.puts(cell.iggy)
    q_file.puts(cell.rationale)
    q_file.puts(cell.subject)
    q_file.puts(cell.category)
  end
  # Close documents
  q_file.close
end



# Take text lines and combine them into
# Ruby objects
def turn_text_into_objects(array)

  # Incoming text Data
  question_text_array = array

  # Outgoing Question Objects
  question_objects_array = Array.new

  # Create class aray for category string
  category = QuestionCategory.new

  # This is template data to test for errors
  # and should not show up on the final objects
  category.category = "in doc_to_array"

  # Loop through each line and create Question objects
  question_text_array.each do |cell|

    # To be overwritten with REGEX scans
    choice_e          = ""
    choice_f          = ""
    choice_g          = ""
    correct_answer    = ""
    iggy              = ""
    rationale         = ""
    subject           = ""


    # Look for text to change category variable
    if cell.include?("CARDIOVASCULAR/CIRCULATORY SYSTEM")
      category.category = cell.chomp.capitalize
    elsif cell.include?("GASTROINTESTINAL SYSTEM")
      category.category = cell.chomp.capitalize
    else
      question_detail_array = cell.split("QBREAK")

      question_detail_array.each do |detail|

        case detail
        when /([E]\.)(.+)/
          if detail[0...3].include?("E")
            choice_e = detail
          end
        when /([F]\.)(.+)/
          choice_f = detail
        when /([G]\.)(.+)/
          choice_g = detail
        when /Ans:|ANS:/
          correct_answer = detail
        when /(Iggy:|.Iggy|Iggy)\s(\w+\.*:?\s*\d+\-?,?\/?\s?\d*)/
          iggy = detail
        when /(Rationale:)\s(.+)/
          rationale = detail
        else
          subject = detail.strip
        end
      end

      question_object = Question.new(
        question_text:    question_detail_array[0],
        choice_a:         question_detail_array[1],
        choice_b:         question_detail_array[2],
        choice_c:         question_detail_array[3],
        choice_d:         question_detail_array[4],
        choice_e:         choice_e,
        choice_f:         choice_f,
        correct_answer:   correct_answer,
        iggy:             iggy,
        rationale:        rationale,
        subject:          subject,
        category:         category.category
        )
      question_objects_array.push(question_object)
    end
  end
  persist_objects(question_objects_array)
  question_objects_array
  binding.pry
end



# Main Program
process_word_document
puts "Need to manually add QBREAK to question 48 ans. A"
binding.pry
turn_text_into_objects(process_text_file)
