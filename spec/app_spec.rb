require "rspec"
require_relative "../lib/app"


RSpec.describe "#process_text_file" do

  before(:context) do
    @text = process_text_file
  end

  context "the questions file" do
    it "returns an array" do
      expect(@text.class).to eq(Array)
      # binding.pry
    end

    it "the returned array size is 54" do
      expect(@text.size).to eq(54)
    end

    it "array's first cell contains text" do
      expect(@text[0].class).to eq(String)
    end

    it "array's first cell includes 'CARDIO'" do
      expect(@text[0]).to include("CARDIO")
    end

    it "array's second cell includes 'QBREAK'" do
      expect(@text[1]).to include("QBREAK")
    end

    it "array's cell 10 begins with '11.'" do
      expect(@text[10][0...3]).to eq("11.")
    end

    it "array's cell 20 begins with '21.'" do
      expect(@text[20][0...3]).to eq("21.")
    end

    it "array's cell 24 includes 'GASTRO'" do
      expect(@text[24]).to include("GASTRO")
    end

    it "array's cell 30 begins with 'A c'" do
      expect(@text[30][0...3]).to eq("A c")
    end

    it "array's cell 40 begins with '38.'" do
      expect(@text[40][0...3]).to eq("38.")
    end

    it "array's cell 50 begins with '48.'" do
      expect(@text[50][0...3]).to eq("48.")
    end

    # binding.pry
    it "array's cell 53 begins with '51.'" do
      expect(@text[53][0...3]).to eq("51.")
    end

  end
end
