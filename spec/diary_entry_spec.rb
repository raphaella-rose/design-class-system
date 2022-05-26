require 'diary_entry'

RSpec.describe DiaryEntry do
  it "returns the title and contents of the entry" do
    entry = DiaryEntry.new("day one", "My name is Raphaella and I am pairing with Hafiz. We are tired of this now.")
    expect(entry.title).to eq "day one"
    expect(entry.contents).to eq "My name is Raphaella and I am pairing with Hafiz. We are tired of this now."
  end

end