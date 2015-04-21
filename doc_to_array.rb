require_relative 'process_word_document'
require_relative 'question_category'
require_relative 'question'
require 'docx'
require 'pry'


# Create Array of Document Lines
text_line_array = Array.new


# Take text from questions_text.txt and create Ruby objects
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




def normalize_object_text(array)

  object_array = array

  object_array.each do |cell|
    # If question text has a number in it, remove it
    if cell.question_text[0...4].match(/\d+\.\s?(.+)/)
      cell.question_text =
        cell.question_text.split(/\d+\.\s?(.+)/)[1].rstrip
    end

    if !cell.choice_a.nil? && cell.choice_a[0...3].include?("A.")
      cell.choice_a =
        cell.choice_a.split(/[A]\.(.+)/)[1].strip
    elsif !cell.choice_a.nil?
      cell.choice_a = cell.choice_a.strip
    end

    if !cell.choice_b.nil? && cell.choice_b[0...4].include?("B.")
      cell.choice_b =
        cell.choice_b.split(/[B]\.(.+)/)[1].strip
    elsif !cell.choice_b.nil?
      cell.choice_b = cell.choice_b.strip
    end

    if !cell.choice_c.nil? && cell.choice_c[0...4].include?("C.")
      cell.choice_c =
        cell.choice_c.split(/[C]\.(.+)/)[1].strip
    elsif !cell.choice_c.nil?
      cell.choice_c = cell.choice_c.strip
    end

    if !cell.choice_d.nil? && cell.choice_d[0...4].include?("D.")
      cell.choice_d =
        cell.choice_d.split(/[D]\.(.+)/)[1].strip
    elsif !cell.choice_d.nil?
      cell.choice_d = cell.choice_d.strip
    end

    if !cell.choice_e.nil? && cell.choice_e[0...4].include?("E.")
      cell.choice_e =
        cell.choice_e.split(/[E]\.(.+)/)[1].strip
    elsif !cell.choice_e.nil?
      cell.choice_e = cell.choice_e.strip
    end

    if !cell.choice_f.nil? && cell.choice_f[0...4].include?("F.")
      cell.choice_f =
        cell.choice_f.split(/[F]\.(.+)/)[1].strip
    elsif !cell.choice_f.nil?
      cell.choice_f = cell.choice_f.strip
    end

    if !cell.correct_answer.nil? &&
        (cell.correct_answer[0...5].include?("Ans:") ||
          cell.correct_answer[0...5].include?("ANS:") )

      cell.correct_answer =
        cell.correct_answer.split(/(Ans:|ANS:)(.[[A-G],* ]+|[[A-G],* ]+)/)[2].strip
    elsif !cell.correct_answer.nil?
      cell.correct_answer = cell.correct_answer.strip
    end

    if !cell.iggy.nil? && cell.iggy.include?("ggy")
      cell.iggy =
        cell.iggy.split(/(Iggy:|.Iggy|Iggy)\s(\w+\.*:?\s*\d+\-?,?\/?\s?\d*)/)[2].strip
    elsif !cell.iggy.nil?
      cell.iggy = cell.iggy.strip
    end

    if !cell.rationale.nil? && cell.rationale.include?("Rationale")
      cell.rationale =
        cell.rationale.split(/(Rationale:)\s(.+)/)[2].strip
    elsif !cell.rationale.nil?
      cell.rationale = cell.rationale.strip
    end

  end
end




def persist_objects(array)
  object_array = array

  normalize_object_text(object_array)

  # Create or open stream to csvquestions.csv document
  if File.exist?('resources/csvquestions.csv') == false
    q_file = File.new('resources/csvquestions.csv', 'w+')
    puts 'Created csvquestions.csv'
  else
    q_file = File.open('resources/csvquestions.csv', 'w+')
    puts 'Opened csvquestions.csv'
  end

  # Add Array Content to Text File
  # to test normalization
  object_array.each do |cell|
    q_file.puts(cell.question_text)
    q_file.puts(cell.choice_a)
    q_file.puts(cell.choice_b)
    q_file.puts(cell.choice_c)
    q_file.puts(cell.choice_d)
    if cell.choice_e != ""
      q_file.puts(cell.choice_e)
    end

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



def turn_text_into_objects(array)

  question_text_array = array
  question_objects_array = Array.new

  # Create class aray for category string
  category = QuestionCategory.new
  category.category = "in doc_to_array"


  question_text_array.each do |cell|

    # To be overwritten with REGEX scans
    choice_e          = ""
    choice_f          = ""
    choice_g          = ""
    correct_answer    = ""
    iggy              = ""
    rationale         = ""
    subject           = ""


    # TODO: Fix question #29 answers E-G (not showing
      # in text document. Enter it in manually?)
    # TODO: Fix categories.
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
        # when Ans:|ANS:)(.[[A-G],* ]+|[[A-G],* ]+)/
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
end




process_word_document
puts "Need to manually add QBREAK to question 48 ans. A"
binding.pry
turn_text_into_objects(process_text_file)
