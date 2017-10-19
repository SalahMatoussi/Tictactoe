class Position
  attr_accessor :board, :turn
  def_initialize
    @board = Array.new(@size, "-")
    @turn = "x"
  end  
end	

