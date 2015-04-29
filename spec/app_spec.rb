require "rspec"
require_relative "../lib/app"


RSpec.describe "#process_text_file" do

  context "using the questions file" do
    it "returns an array" do
      expect(process_text_file.class).to eq(Array)
      # binding.pry
    end

    it "the returned array size is 54" do
      expect(process_text_file.size).to eq(54)
    end
  end
end
