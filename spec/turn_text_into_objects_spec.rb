require "rspec"
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
