require "todo_list"

RSpec.describe TodoList do
  it "returns an empty list of tasks" do
    task = TodoList.new
    expect(task.list).to eq []
  end
end