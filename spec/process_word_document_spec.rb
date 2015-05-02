require "rspec"
require_relative "../lib/process_word_document"

RSpec.describe "ProcessWordDocument" do

  context "File data after #process_word_document" do
    before(:context) do
      process_word_document
      @text = File.open('resources/questions_text.txt')
    end

    it "questions_text.txt is a File" do
      expect(@text.class).to eq(File)
    end

    it "questions_text.txt can be opened" do
      expect(@text.closed?).to eq(false)
    end
  end

  context "Meta Data after #process_word_document" do
    before(:context) do
      @text = File.stat('resources/questions_text.txt')
    end

    it "questions_text.txt has been created" do
      expect(File.exists?("resources/questions_text.txt")).to eq(true)
    end

    it "the returned file size is 38844" do
      expect(@text.size).to eq(38844)
    end
  end
end

