require "rspec"
require 'json'
require_relative "../lib/app"


RSpec.describe "App", :app do
  before(:context) do
    process_word_document
    @text_file_array = process_text_file
    @question_objects_array = turn_text_into_objects(@text_file_array)
    normalize_object_text(@question_objects_array)
    persist_objects(@question_objects_array)
  end
  describe "ProcessWordDocument" do
    it "returns a readable file" do
      @text_file = File.stat('resources/questions_text.txt')
      # binding.pry
      expect(@text_file.readable?).to eq(true)
    end
  end
end
