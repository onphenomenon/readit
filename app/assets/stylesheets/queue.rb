=begin
Implement a Basic Queue

Create a class Queue that implements the following interface:
  - empty? -> returns true or false if the queue is empty or not PARENT[ARRAY]
  - clear -> clears all entries out of the queue
  - size -> returns the number of elements in the queue  PARENT[ARRAY]
  - contains? -> take a value and returns true or false if the queue contains the given value
  - enqueue ->  takes a value and adds it to the queue
  - peek -> returns the value at the front of the queue
  - dequeue -> removes and returns the value that is at the front of the queue

The constructor for Queue should be able to take an array of values and create a queue with those objects enqueued in it. The constructor should also be able to take no arguments and will create an empty queue.

Write tests for your Queue class.
=end

class Que < Array
  attr_accessor :stack

  def initialize(*args)
    @stack = []
    args.each do |x|
      @stack << x
    end
  end

  def clear
    @stack = []
  end

  def contains?(z)
    @stack.include?(z)
  end

  def enqueue(x)
    @stack << x
  end

  def peek
    @stack[0]
  end

  def dequeue
    @stack.slice!(0)
  end
end
