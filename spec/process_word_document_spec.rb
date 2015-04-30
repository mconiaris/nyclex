require "rspec"
require_relative "../lib/process_word_document"

RSpec.describe "#process_word_document" do

  # let(:word_document) do
  #   'resources/questions.docx'
  # end
  # let(:output_file) do
  #   'resources/questions_text.txt'
  # end

  before(:context) do
    process_word_document
    @text = File.open('resources/questions_text.txt', 'w+')
  end

  context "the questions_text.txt" do
    it "class is File" do
      expect(@text.class).to eq(File)
    end
      binding.pry
  end
end
