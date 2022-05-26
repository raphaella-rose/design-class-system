require 'diary'

RSpec.describe Diary do
  it "returns empty array" do
    diary = Diary.new
    expect(diary).to eq diary
  end
end