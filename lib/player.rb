require_relative 'move_requester'

class Player
  def initialize(ui)
    @ui = ui
    @move_requester = MoveRequester.new(@ui)
  end
  
  def move(board)
    @move_requester.request(board)
  end
end
