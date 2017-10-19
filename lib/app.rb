require_relative 'game'
require_relative 'choice_requester'
require_relative 'game_factory'

class App
  def initialize(ui)
    @running = true
    @ui = ui
    @choice_requester = ChoiceRequester.new(ui)
    @MENU_CHOICES = {'Jouer' => self.method(:run_game),
                     'Quitter' => self.method(:exit)}
    @PLAYER_CHOICES = {'Human' => Player.new(ui),}
  end

  def run
    @ui.output('Welcome to Tic Tac Toe')
    while @running
      menu
    end
  end

  private

  def menu
    choice = @choice_requester.request(@MENU_CHOICES.keys)
    @MENU_CHOICES.fetch(choice).call
  end

  def run_game
    @ui.clear
    game = GameFactory.from_input(@ui, @PLAYER_CHOICES)
    game.run
    @ui.output('Thanks for playing.')
  end

  def exit
    @running = false
  end
end
