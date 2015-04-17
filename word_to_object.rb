require_relative 'question'
require 'docx'
require 'pry'

class WordToObject

  def word_to_array

    # Create a Docx::Document object for our existing docx file
    doc = Docx::Document.open('resources/questions.docx')

  # binding.pry

  end

end
