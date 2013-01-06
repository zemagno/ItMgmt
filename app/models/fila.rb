class Fila
  attr_accessor :fila
  
  def initialize
    @fila = []
    @p = 0
    
  end
  
  def enfilera (item)
    @fila.slice!(@p..9999999)
    @fila.slice!(0) if @fila.length > 30
    @p = fila.length
    @fila << item
    @p += 1
    
  end
  
  def ultimo
    @fila.last
  end
  
  def anterior
    if @p > 1 then
      @p -= 1
    end
    @fila[@p-1]
  end
  
  def proximo
    if @p < @fila.length then
      @p += 1
    end
    @fila[@p-1]
  end
  
end

