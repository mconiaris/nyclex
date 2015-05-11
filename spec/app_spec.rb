require "rspec"
require 'json'
require_relative "../lib/app"


RSpec.describe "App", :app do
  before(:context) do
    @text_file = process_word_document
    @text_file_array = process_text_file
    @question_objects_array = turn_text_into_objects(@text_file_array)
    normalize_object_text(@question_objects_array)
    persist_objects(@question_objects_array)
  end
  it "responds to the each method" do
    expect(@question_objects_array).to respond_to(:each)
  end
end
