require "./board"
require "./player"

class Game
  
  # 放置X或者O的位置
  POSITION = %w(1 2 3 4 5 6 7 8 9)
  
  PERSONAL_INFO = <<Doc

***************************************************************
                        Ruby的井字棋游戏
--------------------------------------------------------------
| 作者  : 任凯                                                 
| email: [renkaiswpule@gmail.com]                             
| 2013年12月17日                                               
|                                                             
---------------------------------------------------------------
查看了你们的官网，http://zenhacks.org/ 
我最喜欢[我们把周五下午去投资自己。我们会跑黑客马拉松,去车间或者给开源项目发送Pull Request。]
虽然这个测试跟rails关系不大，不过还是考验一个coder的基本素养,
很希望能够加入Zenhacks Lab
***************************************************************
 
Doc

  def introduction
    puts PERSONAL_INFO
  end
  
  def start board
    players = [Player.new("X"),Player.new("O")].cycle
    current_player = players.next
    loop do
      puts ""
      print "你在哪个位置放棋?请输入 <1-9>:...\n "
      position = gets.chomp
      if !POSITION.include?(position.to_s)
        puts "\n请输入0-9之间的数字...\n"
      elsif %w[X O].include?board.value_hash[position.to_s]
        puts "\n当前位置已经被占用,请选择其他数字...\n"
      else
        current_player.move(board, position)
        current_player = players.next 
      end
    end
  end  
end