
require 'tictactoe'
require "rspec/its"

describe Position do
  its(:board) { should == %w(-)*9 }
  its(:turn) { should == "x" }
  
  context ".new(board,turn)" do
    subject { Position.new(%w(x - - - - - - - -), "o") }
    its(:board) { should == %w(x - - - - - - - -) }
    its(:turn) { should == "o" }
  end
  
  context "#move" do
    subject { Position.new.move(0) }
    its(:board) { should == %w(x - - - - - - - -) }
    its(:turn) { should == "o" }
  end
  
  context "#possible_moves" do
    subject { Position.new.move(0).move(1) }
    its(:possible_moves) { should == [2,3,4,5,6,7,8] }
end                          

