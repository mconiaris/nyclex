require "rspec"
require_relative "../lib/app"

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
    it "cell 20's @choice_e begins with 'Fatigue'" do
      expect(@objects_array[20].choice_e[0...7]).to eq('Fatigue')
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
    it "cell 8's @rationale begins with 'There'" do
      expect(@objects_array[8].rationale[0...5]).to eq('There')
    end
    it "cell 13's @rationale begins with 'Dopamine'" do
      expect(@objects_array[13].rationale[0...8]).to eq('Dopamine')
    end
    it "cell 18's @rationale begins with 'A cardiac'" do
      expect(@objects_array[18].rationale[0...9]).to eq('A cardiac')
    end
    it "cell 23's @rationale begins with 'Rebound'" do
      expect(@objects_array[23].rationale[0...7]).to eq('Rebound')
    end
    it "cell 28's @rationale begins with 'Although'" do
      expect(@objects_array[28].rationale[0...8]).to eq('Although')
    end
    it "cell 33's @rationale begins with 'The only'" do
      expect(@objects_array[33].rationale[0...8]).to eq('The only')
    end
    it "cell 38's @rationale begins with 'Semi-fowl'" do
      expect(@objects_array[38].rationale[0...9]).to eq('Semi-fowl')
    end
    it "cell 40's @rationale beigins with 'The'" do
      expect(@objects_array[40].rationale[0...3]).to eq('The')
    end
    it "cell 43's @rationale begins with 'Red blood'" do
      expect(@objects_array[43].rationale[0...9]).to eq('Red blood')
    end
    it "cell 48's @rationale begins with 'Rest'" do
      expect(@objects_array[48].rationale[0...4]).to eq('Rest')
    end
  end
end

