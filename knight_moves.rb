class Position
  attr_reader :position, :prev_move

  def initialize(pos, prev=nil)
    @position = pos
    @prev_move = prev
  end

  def next_moves
    moves = []
    first = [2, 2, 1, -1, -2, -2, -1, 1]
    second = [1, -1, -2, -2, -1, 1, 2, 2]
    8.times do
      curr = @position.clone
      curr[0] += first.shift
      curr[1] += second.shift
      if @prev_move == nil
        moves << curr unless out_of_board?(curr)
      elsif @prev_move.position != curr
        moves << curr unless out_of_board?(curr)
      end
    end
    moves
  end

  def out_of_board?(pos)
    if (0..7).include?(pos[0]) && (0..7).include?(pos[1])
      return false
    else
      return true
    end
  end
end

def knight_moves(start, goal)
  curr = Position.new(start)
  queue = [curr]
  until curr.position == goal || queue.empty?
    curr = queue.shift
    curr.next_moves.each do |move|
      next_pos = Position.new(move, curr)
      queue << next_pos
    end
  end

  path = []
  count = 0
  until curr == nil
    path << curr.position
    count += 1
    curr = curr.prev_move
  end

  puts "You made it in #{count} moves! Here's your path:"
  until path.empty?
    puts path.pop.to_s
  end
end

knight_moves([0,0],[1,2])
knight_moves([0,0],[3,3])
knight_moves([3,3],[0,0])