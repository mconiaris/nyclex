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

      it "line 0 begins with text that includes CARDIO" do
        expect(@text.readlines[0]).to include("CARDIO")
      end

      it "line 5 begins with '4'" do
        expect(@text.readlines[4][0...2]).to eq("4.")
      end

      it "line 10 begins with '11'" do
        expect(@text.readlines[10][0...3]).to eq("11.")
      end

      it "line 15 begins with '16'" do
        expect(@text.readlines[15][0...3]).to eq("16.")
      end

      it "line 24 begins with text that includes 'GASTRO'" do
        expect(@text.readlines[24]).to include("GASTRO")
      end

      it "line 25 begins with text that includes 'The'" do
        expect(@text.readlines[25][0...3]).to eq("The")
      end

      it "line 30 begins with text that includes 'A c'" do
        expect(@text.readlines[30][0...3]).to eq("A c")
      end

      it "line 35 begins with text that includes 'The'" do
        expect(@text.readlines[35][0...3]).to eq("The")
      end

      it "line 40 begins with text that includes '38.'" do
        expect(@text.readlines[40][0...3]).to eq("38.")
      end

      it "line 45 begins with text that includes '43.'" do
        expect(@text.readlines[45][0...3]).to eq("43.")
      end

      it "line 50 begins with text that includes '48.'" do
        expect(@text.readlines[50][0...3]).to eq("48.")
      end

      it "line 53 begins with text that includes '51.'" do
        expect(@text.readlines[53][0...3]).to eq("51.")
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

