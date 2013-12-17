# == 定义游戏玩家类
class Player
  attr_accessor :id
  
  # id为玩家身份标识符,比如X或者O,通过构造函数initialize来初始化
  def initialize(id) 
    @id = id
  end
  
  # 定义玩家移动棋牌
  # board: 初始化的游戏棋板,包含整个棋牌的信息
  # position: 玩家需要移动的地方,在（1..9）中选择一个合适地数字
  def move(board, position)
    board.value_hash[position] = self.id
    board.display
    winner = board.check_winner
    if winner == "draw"
      display_draw
    elsif winner == "win"
      display_winner
    end
  end
  
  def display_winner
    p "恭喜#{self.id}赢得了比赛!!!"
    exit
  end
  
  def display_draw
    p "平局"
    exit
  end
end