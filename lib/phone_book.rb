class PhoneBook
  def initialize(diary)
    @contents = diary.all
    @numbers = []
  end

  def get_numbers()
    @contents.each do |string|
      unless string.scan(/^[0-9]+$/).empty? 
        @numbers.push(string.scan(/^[0-9]+$/)[0])
      end
    end
    return @numbers
  end

end