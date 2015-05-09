require "rspec"
require 'json'
require_relative "../lib/app"

# Tests that Data from Text Document Turns Into Question Objects
RSpec.describe "#turn_text_into_objects", :text_to_object do
  before(:context) do
    @text_array = process_text_file
    @objects_array = turn_text_into_objects(@text_array)
  end
  context "the container of paragraphs" do
    it "cell 0 returns a Question Object" do
      expect(@objects_array[0].class).to eq(Question)
    end
    it "cell 1's @question_text beigins with '2. W'" do
      expect(@objects_array[1].question_text[0...4]).to eq('2. W')
    end
    it "cell 5's @choice_a beigins with ' A.A d'" do
      expect(@objects_array[5].choice_a[0...6]).to eq(' A.A d')
    end
    it "cell 10's @choice_b beigins with ' B.Insp'" do
      expect(@objects_array[10].choice_b[0...7]).to eq(' B.Insp')
    end
    it "cell 15's @choice_c beigins with ' C.“Rep'" do
      expect(@objects_array[15].choice_c[0...7]).to eq(' C.“Rep')
    end
    it "cell 20's @choice_f beigins with ' F. H'" do
      expect(@objects_array[20].choice_f[0...5]).to eq(' F. H')
    end
    it "cell 25's @choice_d beigins with ' D.Pr'" do
      expect(@objects_array[25].choice_d[0...5]).to eq(' D.Pr')
    end
    it "cell 30's @correct_answer beigins with ' ANS: D'" do
      expect(@objects_array[30].correct_answer).to eq(' ANS: D')
    end
    it "cell 35's @iggy beigins with ' Igg'" do
      expect(@objects_array[35].iggy[0...4]).to eq(' Igg')
    end
    it "cell 40's @rationale beigins with ' Ra'" do
      expect(@objects_array[40].rationale[0...3]).to eq(' Ra')
    end
    it "cell 45's @choice_e beigins with 'Gatro'" do
      expect(@objects_array[45].category[0...6]).to eq('Gastro')
    end
    it "cell 50's @question_text beigins with '50. Th'" do
      expect(@objects_array[50].question_text[0...6]).to eq('50. Th')
    end
    it "cell 51's @question_text beigins with ' A.Sel'" do
      expect(@objects_array[51].choice_a[0...6]).to eq(' A.Sel')
    end
  end
end





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
