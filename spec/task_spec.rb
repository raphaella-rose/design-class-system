require "task"

RSpec.describe Task do
    it "shows the task" do
        task = Task.new("Cleaning")
        expect(task.title).to eq "Cleaning"
    end
    
end