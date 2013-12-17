#== 定义游戏棋板
class Board
  attr_accessor  :value_hash
  
  # 检测所有能够赢的位置
  WINNING_PLACES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  
  # 构造函数初始化3X3矩阵的值
  # 矩阵行列值置空
  def initialize 
    @value_hash = Hash[(1..9).map{|sym| [sym, " "]}]
  end
  
  
  # console初始化界面
  def init_view 
    puts ""
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts ""
  end
  
  # 打印当前X和O的步局
  # 为了美观，如果当前位置没有值使用它的index来代替
  def display
    puts ""
    puts " #{self.value_hash["1"] ||= "1"} | #{self.value_hash["2"] ||= "2"} | #{self.value_hash["3"] ||= "3"} "
    puts "---------"
    puts " #{self.value_hash["4"] ||= "4"} | #{self.value_hash["5"] ||= "5"} | #{self.value_hash["6"] ||= "6"} "
    puts "---------"
    puts " #{self.value_hash["7"] ||= "7"} | #{self.value_hash["8"] ||= "8"} | #{self.value_hash["9"] ||= "9"} "
    puts ""
  end
  
  # 检测输赢每次下棋后整个棋牌的状态,
  # if: x_count || o_count 有一个为3 ,那么游戏结束
  # 存在棋牌已满，但是x_cout或者o_cout都不为3，那么为和棋，重新开始
  def check_winner
    x_count = 0
    o_count = 0
    WINNING_PLACES.each do |winning_place|
      winning_place.each do |index|
        if self.value_hash["#{index}"] == "X"
          x_count = x_count + 1
        elsif self.value_hash["#{index}"] == "O"
          o_count = o_count + 1
        end
      end
      if x_count == 3 or o_count == 3
        break
      else
        x_count = 0
        o_count = 0
      end
    end
    if draw?
      return "draw"
    elsif x_count == 3 or o_count == 3
      return "win"
    else
      return "continue"
    end
  end
  
  # 判断当前是否为平局
  def draw?
    count = 0
    self.value_hash.each do |key,value|
      count = count + 1  if %w[X O].include? value
    end
    count == 9
  end
end