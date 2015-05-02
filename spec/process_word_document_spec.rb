require "rspec"
require_relative "../lib/process_word_document"

RSpec.describe "ProcessWordDocument" do

  context "File data after #process_word_document" do
    before(:context) do
      process_word_document
      @text = File.open('resources/questions_text.txt')
    end

    describe "questions_text" do
      it "is a File" do
        expect(@text.class).to eq(File)
      end

      it "can be opened" do
        expect(@text.closed?).to eq(false)
      end

      # it "questions_text.txt can be opened" do
      #   expect(@text.closed?).to eq(false)
      # end
          # binding.pry
    end
  end

  context "Meta Data after #process_word_document" do
    before(:context) do
      @text = File.stat('resources/questions_text.txt')
    end

    describe "questions_text.txt" do
      it "has been created" do
        expect(File.exists?("resources/questions_text.txt")).to eq(true)
      end

      it "file size is 38844" do
        expect(@text.size).to eq(38844)
      end

      it "is readable" do
        expect(@text.readable?).to eq(true)
      end
    end

  end
end

