class MoveRequester
  def initialize(ui)
    @ui = ui
  end

  def request(board)
    @ui.output('Fais un smartmove bg:')
    result = @ui.input
    unless valid?(result, board)
      @ui.output('Tu parles Chinois. Recommence !')
      return request(board)
    end
    result.to_i
  end

  private

  def valid?(result, board)
    i?(result) && available?(result, board)
  end

  def available?(result, board)
    board.available_moves.include?(result.to_i)
  end

  def i?(string)
    string.to_i.to_s == string
  end
end
