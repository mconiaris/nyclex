require "rspec"
require 'json'
require_relative "../lib/app"


RSpec.describe "#process_text_file", :text_to_array do

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

# Tests the normalization of data
RSpec.describe "#normalize_object_text", :normalize do
  before(:context) do
    @text_array = process_text_file
    @objects_array = turn_text_into_objects(@text_array)
    normalize_object_text(@objects_array)
  end

  context "the container" do
    it "returns a Question Object from cell 0" do
      # binding.pry
      expect(@objects_array[0].class).to eq(Question)
    end
    it "responds to the each method" do
      expect(@objects_array).to respond_to(:each)
    end
  end

  context "#normalize_question_text" do
    it "cell 1's @question_text begins with 'When'" do
      expect(@objects_array[1].question_text[0...4]).to eq('When')
    end
    it "cell 10's @question_text begins with 'The'" do
      expect(@objects_array[10].question_text[0...3]).to eq('The')
    end
    it "cell 15's @question_text begins with 'The'" do
      expect(@objects_array[15].question_text[0...3]).to eq('The')
    end
    it "cell 20's @question_text begins with 'A m'" do
      expect(@objects_array[20].question_text[0...3]).to eq('A m')
    end
    it "cell 25's @question_text begins with 'Which'" do
      expect(@objects_array[25].question_text[0...5]).to eq('Which')
    end
    it "cell 30's @question_text begins with 'The n'" do
      expect(@objects_array[30].question_text[0...5]).to eq('The n')
    end
    it "cell 35's @question_text begins with 'The n'" do
      expect(@objects_array[35].question_text[0...5]).to eq('The n')
    end
    it "cell 40's @question_text begins with 'The n'" do
      expect(@objects_array[40].question_text[0...5]).to eq('The n')
    end
    it "cell 45's @question_text begins with 'The n'" do
      expect(@objects_array[45].question_text[0...5]).to eq('The n')
    end
    it "cell 50's @question_text begins with 'The nu'" do
      expect(@objects_array[50].question_text[0...6]).to eq('The nu')
    end
    it "cell 51's @question_text begins with 'The nu'" do
      expect(@objects_array[51].question_text[0...6]).to eq('The nu')
    end
  end

  context "#normalize_answer_a" do
    it "cell 0's @choice_a bgins with 'Urine'" do
      expect(@objects_array[0].choice_a[0...5]).to eq('Urine')
    end
    it "cell 5's @choice_a bgins with 'A drop'" do
      expect(@objects_array[5].choice_a[0...6]).to eq('A drop')
    end
    it "cell 6's @choice_a bgins with '“I’m'" do
      expect(@objects_array[6].choice_a[0...4]).to eq('“I’m')
    end
    it "cell 11's @choice_a bgins with 'Assist'" do
      expect(@objects_array[11].choice_a[0...6]).to eq('Assist')
    end
    it "cell 16's @choice_a bgins with 'Perfor'" do
      expect(@objects_array[16].choice_a[0...6]).to eq('Perfor')
    end
    it "cell 21's @choice_a bgins with 'Begin'" do
      expect(@objects_array[21].choice_a[0...5]).to eq('Begin')
    end
    it "cell 26's @choice_a bgins with 'Upper'" do
      expect(@objects_array[26].choice_a[0...5]).to eq('Upper')
    end
    it "cell 31's @choice_a bgins with '“You'" do
      expect(@objects_array[31].choice_a[0...4]).to eq('“You')
    end
    it "cell 36's @choice_a bgins with '“Ambul'" do
      expect(@objects_array[36].choice_a[0...6]).to eq('“Ambul')
    end
    it "cell 41's @choice_a bgins with 'Discus'" do
      expect(@objects_array[41].choice_a[0...6]).to eq('Discus')
    end
    it "cell 46's @choice_a bgins with 'A c'" do
      expect(@objects_array[46].choice_a[0...2]).to eq('A c')
    end
    it "cell 51's @choice_a bgins with 'Select'" do
      expect(@objects_array[51].choice_a[0...6]).to eq('Select')
    end
  end

  context "#normalize_answer_b" do
    it "cell 2's @choice_b gins with '“Excess'" do
      expect(@objects_array[2].choice_b[0...7]).to eq('“Excess')
    end
    it "cell 7's @choice_b gins with 'Increase'" do
      expect(@objects_array[7].choice_b[0...8]).to eq('Increase')
    end
    it "cell 10's @choice_b gins with 'Inspect'" do
      expect(@objects_array[10].choice_b[0...7]).to eq('Inspect')
    end
    it "cell 12's @choice_b gins with 'Hypotens'" do
      expect(@objects_array[12].choice_b[0...8]).to eq('Hypotens')
    end
    it "cell 22's @choice_b gins with '“If my'" do
      expect(@objects_array[22].choice_b[0...6]).to eq('“If my')
    end
    it "cell 27's @choice_b gins with '“The'" do
      expect(@objects_array[27].choice_b[0...4]).to eq('“The')
    end
    it "cell 32's @choice_b gins with 'Cholesty'" do
      expect(@objects_array[32].choice_b[0...8]).to eq('Cholesty')
    end
    it "cell 37's @choice_b gins with 'Rebound'" do
      expect(@objects_array[37].choice_b[0...7]).to eq('Rebound')
    end
    it "cell 42's @choice_b gins with 'Ham'" do
      expect(@objects_array[42].choice_b[0...3]).to eq('Ham')
    end
    it "cell 47's @choice_b gins with 'Viral'" do
      expect(@objects_array[47].choice_b[0...5]).to eq('Viral')
    end
  end

  context "#normalize_answer_c" do
    it "cell 3's @choice_cgins with '“Smoking'" do
      expect(@objects_array[3].choice_c[0...8]).to eq('“Smoking')
    end
    it "cell 8's @choice_cgins with '“You'" do
      expect(@objects_array[8].choice_c[0...4]).to eq('“You')
    end
    it "cell 15's @choice_cgins with '“Report'" do
      expect(@objects_array[15].choice_c[0...7]).to eq('“Report')
    end
    it "cell 18's @choice_cgins with 'Initiate'" do
      expect(@objects_array[18].choice_c[0...8]).to eq('Initiate')
    end
    it "cell 13's @choice_cgins with 'Increase'" do
      expect(@objects_array[13].choice_c[0...8]).to eq('Increase')
    end
    it "cell 23's @choice_cgins with 'Immediate'" do
      expect(@objects_array[23].choice_c[0...9]).to eq('Immediate')
    end
    it "cell 28's @choice_cgins with 'Green'" do
      expect(@objects_array[28].choice_c[0...5]).to eq('Green')
    end
    it "cell 33's @choice_cgins with '“These'" do
      expect(@objects_array[33].choice_c[0...6]).to eq('“These')
    end
    it "cell 38's @choice_cgins with 'Semi'" do
      expect(@objects_array[38].choice_c[0...4]).to eq('Semi')
    end
    it "cell 43's @choice_cgins with 'Red'" do
      expect(@objects_array[43].choice_c[0...3]).to eq('Red')
    end
    it "cell 48's @choice_cgins with 'Encouragi'" do
      expect(@objects_array[48].choice_c[0...9]).to eq('Encouragi')
    end
  end

  context "#normalize_answer_d" do
      it "cell 4's @choice_d begins with 'Atherosc'" do
      expect(@objects_array[4].choice_d[0...8]).to eq('Atherosc')
    end
    it "cell 9's @choice_d begins with '“I a'" do
      expect(@objects_array[9].choice_d[0...4]).to eq('“I a')
    end
    it "cell 14's @choice_d begins with 'Stop'" do
      expect(@objects_array[14].choice_d[0...4]).to eq('Stop')
    end
    it "cell 19's @choice_d begins with '“I have'" do
      expect(@objects_array[19].choice_d[0...7]).to eq('“I have')
    end
    it "cell 24's @choice_d begins with 'Increased'" do
      expect(@objects_array[24].choice_d[0...9]).to eq('Increased')
    end
    it "cell 25's @choice_d begins with 'Proth'" do
      expect(@objects_array[25].choice_d[0...5]).to eq('Proth')
    end
    it "cell 29's @choice_d begins with 'Client'" do
      expect(@objects_array[29].choice_d[0...6]).to eq('Client')
    end
    it "cell 34's @choice_d begins with 'Irriga'" do
      expect(@objects_array[34].choice_d[0...6]).to eq('Irriga')
    end
    it "cell 39's @choice_d begins with 'Fluid'" do
      expect(@objects_array[39].choice_d[0...5]).to eq('Fluid')
    end
    it "cell 44's @choice_d begins with 'A s'" do
      expect(@objects_array[44].choice_d[0...3]).to eq('A s')
    end
    it "cell 49's @choice_d begins with 'Hepatitis'" do
      expect(@objects_array[49].choice_d[0...9]).to eq('Hepatitis')
    end
  end

  context "#normalize_answer_e" do
    it "cell 20's @choice_e begins with 'Cardio'" do
      expect(@objects_array[20].category[0...6]).to eq('Cardio')
    end
    it "cell 45's @choice_e begins with 'Gatro'" do
      expect(@objects_array[45].category[0...6]).to eq('Gastro')
    end
  end

  context "#normalize_answer_f" do
    it "cell 20's @choice_f begins with 'Hyper'" do
      expect(@objects_array[20].choice_f[0...5]).to eq('Hyper')
    end
  end

  context "#normalize_correct_answer" do
    it "cell 's @correct_answer equals 'D'" do
      expect(@objects_array[0].correct_answer).to eq('D')
    end
    it "cell 5's @correct_answer equals 'C'" do
      expect(@objects_array[5].correct_answer).to eq('C')
    end
    it "cell 10's @correct_answer equals 'B'" do
      expect(@objects_array[10].correct_answer).to eq('B')
    end
    it "cell 15's @correct_answer equals 'C'" do
      expect(@objects_array[15].correct_answer).to eq('C')
    end
    it "cell 20's @correct_answer begins with 'A,'" do
      expect(@objects_array[20].correct_answer[0...2]).to eq('A,')
    end
    it "cell 25's @correct_answer equals 'A'" do
      expect(@objects_array[25].correct_answer).to eq('A')
    end
    it "cell 30's @correct_answer equals 'D'" do
      expect(@objects_array[30].correct_answer).to eq('D')
    end
    it "cell 35's @correct_answer equals 'B'" do
      expect(@objects_array[35].correct_answer).to eq('B')
    end
    it "cell 40's @correct_answer begins with 'A,'" do
      expect(@objects_array[40].correct_answer[0...2]).to eq('A,')
    end
    it "cell 45's @correct_answer equals 'B'" do
      expect(@objects_array[45].correct_answer).to eq('B')
    end
    it "cell 50's @correct_answer equals 'A'" do
      expect(@objects_array[50].correct_answer).to eq('A')
    end
    it "cell 51's @correct_answer equals 'B'" do
      expect(@objects_array[51].correct_answer).to eq('B')
    end
  end

  context "#normalize_iggy" do
    it "cell 2's @iggy begins with 'pp.'" do
      expect(@objects_array[2].iggy[0...3]).to eq('pp.')
    end
    it "cell 7's @iggy begins with 'pg'" do
      expect(@objects_array[7].iggy[0...2]).to eq('pg')
    end
    it "cell 10's @iggy begins with 'pg 2'" do
      expect(@objects_array[10].iggy[0...4]).to eq('pg 2')
    end
    it "cell 12's @iggy begins with 'pg:'" do
      expect(@objects_array[12].iggy[0...3]).to eq('pg:')
    end
    it "cell 22's @iggy begins with 'pg'" do
      expect(@objects_array[22].iggy[0...2]).to eq('pg')
    end
    it "cell 27's @iggy begins with 'pg 1'" do
      expect(@objects_array[27].iggy[0...4]).to eq('pg 1')
    end
    it "cell 32's @iggy begins with 'pg 1'" do
      expect(@objects_array[32].iggy[0...4]).to eq('pg 1')
    end
    it "cell 35's @iggy beigins with 'iggy'" do
      expect(@objects_array[35].iggy[0...4]).to eq('pg 1')
    end
    it "cell 37's @iggy begins with 'pg 1'" do
      expect(@objects_array[37].iggy[0...4]).to eq('pg 1')
    end
    it "cell 42's @iggy begins with 'pg'" do
      expect(@objects_array[42].iggy[0...2]).to eq('pg')
    end
    it "cell 47's @iggy begins with 'pg 1'" do
      expect(@objects_array[47].iggy[0...4]).to eq('pg 1')
    end
  end

  context "normalize_rationale" do
    it "cell 3's @rationale begins with 'Nicotine'" do
      expect(@objects_array[3].rationale[0...8]).to eq('Nicotine')
    end
    it "cell 8's @rationale begins with 'pg'" do
      expect(@objects_array[8].rationale[0...9]).to eq('pg')
    end
    it "cell 13's @rationale begins with 'pg:'" do
      expect(@objects_array[13].rationale[0...9]).to eq('pg:')
    end
    it "cell 18's @rationale begins with 'pg 2'" do
      expect(@objects_array[18].rationale[0...9]).to eq('pg 2')
    end
    it "cell 23's @rationale begins with 'pg'" do
      expect(@objects_array[23].rationale[0...9]).to eq('pg')
    end
    it "cell 28's @rationale begins with 'pg 1'" do
      expect(@objects_array[28].rationale[0...9]).to eq('pg 1')
    end
    it "cell 33's @rationale begins with 'pg 1'" do
      expect(@objects_array[33].rationale[0...9]).to eq('pg 1')
    end
    it "cell 38's @rationale begins with 'pg 1'" do
      expect(@objects_array[38].rationale[0...9]).to eq('pg 1')
    end
    it "cell 40's @rationale beigins with 'The'" do
      expect(@objects_array[40].rationale[0...9]).to eq('The')
    end
    it "cell 43's @rationale begins with 'pg'" do
      expect(@objects_array[43].rationale[0...9]).to eq('pg')
    end
    it "cell 48's @rationale begins with 'pg 1'" do
      expect(@objects_array[48].rationale[0...9]).to eq('pg 1')
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

      # it "is opened" do
      #   expect(@json_file.closed?).to eq(false)
      # end



      it "line 0 returns a json object of a Question type" do
        json_text = JSON.parse(@json_file.readlines[0])
        expect(json_text["json_class"]).to include("Question")
      end

      it "line 5 begins with 'A patient'" do
        json_text = JSON.parse(@json_file.readlines[5])
        expect(json_text["data"]["question_text"][0...9]).to eq("A patient")
      end


    end
  end

  context "Meta Data after #persist_objects" do
    before(:context) do
      @file = File.stat('resources/questions.json')
    end

    describe "questions_text.txt" do
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
