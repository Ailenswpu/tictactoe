require '../board'

describe Board do
  
  it "return the init matrix value " do
    Board.new.value_hash.should eql Hash[(1..9).map{|sym| [sym, " "]}]
  end
  
  it "should  draw" do
    board = Board.new
    @hash = Hash[(1..9).map{|sym| [sym, sym.to_i % 2 == 0 ? "X" : "O"]}]
    board.value_hash = @hash
    board.check_winner.should eql "draw"
  end
  
  
end