module Queueable
  

  def init_queue
    @queue = []
  end
  
  def queue
    @queue ||= []
  end
  

  # os metodos abaixo vao chamar o metodo 'queue' que devolve a fila, e nao a fila em si.
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