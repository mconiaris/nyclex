require "rspec"
require 'json'
require_relative "../lib/app"

# Tests that Data from Text Document Turns Into Question Objects
RSpec.describe "#persist_objects", :persist_objects do
  before(:context) do
    @text_array = process_text_file
    @objects_array = turn_text_into_objects(@text_array)
    normalize_object_text(@objects_array)
    persist_objects(@objects_array)
    @json_file = File.open('resources/questions.json')
  end
  context "File data after #persist_objects" do
    before(:each) do
      @json_file.rewind
    end
    describe "questions.json" do

      it "line 0 returns a json object of a Question type" do
        json_text = JSON.parse(@json_file.readlines[0])
        expect(json_text["json_class"]).to include("Question")
      end

      it "line 5 question_text begins with 'A patient'" do
        json_text = JSON.parse(@json_file.readlines[5])
        expect(json_text["data"]["question_text"][0...9]).to eq("A patient")
      end

      it "line 10 choice_a begins with 'Increase'" do
        json_text = JSON.parse(@json_file.readlines[10])
        expect(json_text["data"]["choice_a"][0...8]).to eq("Increase")
      end

      it "line 15 choice_b begins with '“Always'" do
        json_text = JSON.parse(@json_file.readlines[15])
        expect(json_text["data"]["choice_b"][0...7]).to eq("“Always")
      end
      it "line 20 choice_f begins with 'Hyper'" do
        json_text = JSON.parse(@json_file.readlines[20])
        expect(json_text["data"]["choice_f"][0...5]).to eq("Hyper")
      end
      it "line 25 choice_c begins with 'Hemoglo'" do
        json_text = JSON.parse(@json_file.readlines[25])
        expect(json_text["data"]["choice_c"][0...7]).to eq("Hemoglo")
      end
      it "line 30 choice_d begins with 'The'" do
        json_text = JSON.parse(@json_file.readlines[30])
        expect(json_text["data"]["choice_d"][0...3]).to eq("The")
      end
      it "line 35 correct_answer begins with 'B'" do
        json_text = JSON.parse(@json_file.readlines[35])
        expect(json_text["data"]["correct_answer"]).to eq("B")
      end
      it "line 40 choice_e begins with 'Deep'" do
        json_text = JSON.parse(@json_file.readlines[40])
        expect(json_text["data"]["choice_e"][0...4]).to eq("Deep")
      end
      it "line 45 iggy begins with 'pg'" do
        json_text = JSON.parse(@json_file.readlines[45])
        expect(json_text["data"]["iggy"][0...2]).to eq("pg")
      end
      it "line 50 rationale begins with 'Hepatitis'" do
        json_text = JSON.parse(@json_file.readlines[50])
        expect(json_text["data"]["rationale"][0...9]).to eq("Hepatitis")
      end
    end
  end

  context "Meta Data after #persist_objects" do
    before(:context) do
      @file = File.stat('resources/questions.json')
    end

    describe "questions.json" do
      it "has been created" do
        expect(File.exists?("resources/questions.json")).to eq(true)
      end

      it "size is 46814" do
        expect(@file.size).to eq(46816)
      end

      it "is readable" do
        expect(@file.readable?).to eq(true)
      end
    end
  end
end
