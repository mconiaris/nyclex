require "rspec"
require_relative "../lib/app"

RSpec.describe "ProcessTextFile" do

  describe "#process_text_file", :text_to_array do
    before(:context) do
      @text = process_text_file
    end

    context "the questions file creates an object that" do
      it "responds to the #each method" do
        expect(@text).to respond_to(:each)
      end

      it "responds to the #size method" do
        expect(@text).to respond_to(:size)
      end

      it "has a returned size of 54" do
        expect(@text.size).to eq(54)
      end

      it "has a first cell that contains text" do
        expect(@text[0].class).to eq(String)
      end

      it "has a first cell that includes 'CARDIO'" do
        expect(@text[0]).to include("CARDIO")
      end

      it "has a second cell that includes 'QBREAK'" do
        expect(@text[1]).to include("QBREAK")
      end

      it "begins with '5.' in cell 5" do
        expect(@text[5][0...2]).to eq("5.")
      end

      it "begins with '11.' in cell 10" do
        expect(@text[10][0...3]).to eq("11.")
      end

      it "begins with '16.' in cell 15" do
        expect(@text[15][0...3]).to eq("16.")
      end

      it "begins with '21.' in cell 20" do
        expect(@text[20][0...3]).to eq("21.")
      end

      it "includes 'GASTRO' in cell 24" do
        expect(@text[24]).to include("GASTRO")
      end

      it "begins with 'A c' in cell 30" do
        expect(@text[30][0...3]).to eq("A c")
      end

      it "begins with 'The' in cell 35" do
        expect(@text[35][0...3]).to eq("The")
      end

      it "begins with '38.' in cell 40" do
        expect(@text[40][0...3]).to eq("38.")
      end

      it "begins with '43.' in cell 45" do
        expect(@text[45][0...3]).to eq("43.")
      end

      it "begins with '48.' in cell 50" do
        expect(@text[50][0...3]).to eq("48.")
      end

      # binding.pry
      it "begins with '51.' in cell 53" do
        expect(@text[53][0...3]).to eq("51.")
      end
    end
  end
end
