require "rspec"
require_relative "../lib/process_word_document"

RSpec.describe "ProcessWordDocument" do

  context "File data after #process_word_document" do
    before(:context) do
      process_word_document
      @text = File.open('resources/questions_text.txt')
    end

    describe "questions_text" do
      before(:each) do
        @text.rewind
      end

      it "is a File" do
        expect(@text.class).to eq(File)
      end

      it "can be opened" do
        expect(@text.closed?).to eq(false)
      end

      it "begins with text that includes CARDIO" do
        expect(@text.readline).to include("CARDIO")
      end

      it "line 5 begins with '4'" do
          # binding.pry
        expect(@text.readlines[4][0...2]).to eq("4.")
      end

      it "line 10 begins with '11'" do
          # binding.pry
        expect(@text.readlines[10][0...3]).to eq("11.")
      end
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

