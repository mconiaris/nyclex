require "rspec"
require_relative "../lib/app"


RSpec.describe "#process_text_file" do

  before(:context) do
    @text = process_text_file
  end

  context "the questions file creates an object that" do
    it "responds to the #each method" do
      expect(@text).to respond_to(:each)
      # binding.pry
    end

    it "responds to the #size method" do
      expect(@text).to respond_to(:size)
      # binding.pry
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
RSpec.describe "#turn_text_into_objects" do
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
RSpec.describe "#normalize_object_text" do
  before(:context) do
    @text_array = process_text_file
    @objects_array = turn_text_into_objects(@text_array)
    normalize_object_text(@objects_array)
  end
  context "the container" do
    it "returns a Question Object from cell 0" do
      expect(@objects_array[0].class).to eq(Question)
    end
  end
  context "#normalize_question_text" do
    it "cell 1's @question_text beigins with 'When'" do
      expect(@objects_array[1].question_text[0...4]).to eq('When')
    end
    it "cell 50's @question_text beigins with 'The nu'" do
      expect(@objects_array[50].question_text[0...6]).to eq('The nu')
    end
    it "cell 51's @question_text beigins with 'Select'" do
      expect(@objects_array[51].choice_a[0...6]).to eq('Select')
    end
  end
  context "#normalize_answer_a" do
    it "cell 5's @choice_a beigins with 'A drop'" do
      expect(@objects_array[5].choice_a[0...6]).to eq('A drop')
    end
  end
  context "#normalize_answer_b" do
    it "cell 10's @choice_b beigins with 'Inspect'" do
      expect(@objects_array[10].choice_b[0...7]).to eq('Inspect')
    end
  end
  context "#normalize_answer_c" do
    it "cell 15's @choice_c beigins with '“Report'" do
      expect(@objects_array[15].choice_c[0...7]).to eq('“Report')
    end
  end
  context "#normalize_answer_d" do
    it "cell 25's @choice_d beigins with 'Proth'" do
      expect(@objects_array[25].choice_d[0...5]).to eq('Proth')
    end
  end
  # TODO write test for this
  # context "#normalize_answer_e" do

  # end
  context "#normalize_answer_f" do
    it "cell 20's @choice_f beigins with 'Hyper'" do
      expect(@objects_array[20].choice_f[0...5]).to eq('Hyper')
    end
  end
  context "#normalize_correct_answer" do
    it "cell 30's @correct_answer beigins with 'The'" do
      expect(@objects_array[30].correct_answer).to eq('D')
    end
  end
end
#
#     it "cell 35's @iggy beigins with 'iggy'" do
#       expect(@objects_array[35].iggy[0...4]).to eq('pg 1')
#     end
#     it "cell 40's @rationale beigins with 'The'" do
#       expect(@objects_array[40].rationale[0...3]).to eq('The')
#     end
#     it "cell 45's @choice_e beigins with 'Gatro'" do
#       expect(@objects_array[45].category[0...6]).to eq('Gastro')
#     end
#
#   end
# end
