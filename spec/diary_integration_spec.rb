require 'diary'
require 'diary_entry'
require 'diary_reader'
require 'phone_book'

RSpec.describe "diary integration" do
  it "Adds entry to entries log" do
    diary = Diary.new
    entry = DiaryEntry.new("day one", "My name is Raphaella and I am pairing with Hafiz. We are tired of this now.")
    diary.add(entry)
    expect(diary.all).to eq [entry.title, entry.contents]
  end
  
  it "Adds more entries to entries log" do
    diary = Diary.new
    entry1 = DiaryEntry.new("day one", "My name is Raphaella and I am pairing with Hafiz. We are tired of this now.")
    entry2 = DiaryEntry.new("day two","My name is Hafiz and I am pairing with Raphaella. We are tired of this now.")
    diary.add(entry1)
    diary.add(entry2)
    expect(diary.all).to eq [entry1.title, entry1.contents, entry2.title, entry2.contents]
  end
  
  it "returns the number of words a user can read per minute" do
    entry = DiaryEntry.new("day one", "My name is Raphaella and I am pairing with Hafiz. We are tired of this now.")
    diary_reader = DiaryReader.new(entry.contents)
    expect(diary_reader.reading_time(4)).to eq 4
  end

  it "returns a string containing the text the reader has time to read in the given number of minutes" do
    diary_entry = DiaryEntry.new("day one", "My name is Raphaella and I am pairing with Hafiz. We are tired of this now.")
    diary_reader = DiaryReader.new(diary_entry.contents)
    expect(diary_reader.reading_chunk(4,2)).to eq "My name is Raphaella and I am pairing"
  end

  it "returns false if the contents can't be read in the given time" do
    diary_entry = DiaryEntry.new("day one", "My name is Raphaella and I am pairing with Hafiz. We are tired of this now.")
    diary_reader = DiaryReader.new(diary_entry.contents)
    diary_reader.reading_chunk(4,2)
    expect(diary_reader.can_read?).to eq false
  end

  it "returns true if the contents can be read in the given time" do
    diary_entry = DiaryEntry.new("day one", "My name is Raphaella and I am pairing with Hafiz. We are tired of this now.")
    diary_reader = DiaryReader.new(diary_entry.contents)
    diary_reader.reading_chunk(4,4)
    expect(diary_reader.can_read?).to eq true
  end

  it "gets phone number from the contents" do
    diary = Diary.new
    diary.add(DiaryEntry.new("day one", "07961972182"))
    phone_book = PhoneBook.new(diary)
    expect(phone_book.get_numbers).to eq ["07961972182"]
  end

  it "gets phone numbers from the contents" do
    diary = Diary.new
    diary.add(DiaryEntry.new("day one", "07961972182"))
    diary.add(DiaryEntry.new("day two", "07949891081"))
    phone_book = PhoneBook.new(diary)
    expect(phone_book.get_numbers).to eq ["07961972182", "07949891081"]
  end

end