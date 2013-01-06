module Queueable
  
  def init_queue
    @queue = []
  end
  
  def queue
    @queue ||= []
  end
  
  def enqueue(obj)
    queue.push(obj)
  end
  
  def dequeue
   queue.shift 
  end
  
  def queue_empty?
    queue.empty?
  end

end