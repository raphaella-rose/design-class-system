require "task_list"
require "task"

RSpec.describe "Todo Intergration" do
    it "returns empty array" do
        task_list = TaskList.new
        expect(task_list).to eq task_list
    end
    it "Adds task to task list" do
        task_list = TaskList.new
        task = Task.new("Cleaning")
        expect(task_list.add(task)).to eq [task]
    end
    it "Adds more task to task list" do
        task_list = TaskList.new
        task_list.add(task1 = Task.new("Cleaning"))
        task_list.add(task2 = Task.new("Cooking"))
        expect(task_list.all).to eq [task1,task2]
    end
end