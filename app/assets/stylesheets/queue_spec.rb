context "already_voted?" do
  before(:all) do
    queue = Que.new(1,2,3)
  end

  it "returns true or false if the queue is empty or not" do
    expect(queue.empty?).to eq(false)
  end

  it "clears all entries out of the queue" do
    expect(queue.clear).to be_empty
  end

  it "returns the number of elements in the queue" do
   expect(queue.size).to eq(3)
  end

  it "takes a value and returns true or false if the queue contains the given value" do
   expect(queue.contains?(1)).to eq(true)
  end

  it "takes a value and adds it to the queue" do
    queue.enqueue(5)
    expect(queue.stack).to eq(1,2,3,5)
  end

  it "returns the value at the front of the queue" do
    expect(queue.peek).to eq(1)
  end

  it "removes and returns the value that is at the front of the queue"
    expect(queue.dequeue).to eq(1)
    expect(queue.stack).to eq(2,3,5)
  end

end
