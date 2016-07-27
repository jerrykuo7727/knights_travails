def knight_moves(start, goal)

end

def all_moves(start)
  moves = []
  first = [2, 2, 1, -1, -2, -2, -1, 1]
  second = [1, -1, -2, -2, -1, 1, 2, 2]
  8.times do
    curr = start.clone
    puts "curr: #{curr}"
    curr[0] += first.shift
    curr[1] += second.shift
    puts "after: #{curr[0]},#{curr[1]}"
    moves << curr unless out_of_board?(curr)
  end
  moves
end

def out_of_board?(place)
  if (0..7).include?(place[0]) && (0..7).include?(place[1])
    return false
  else
    return true
  end
end


p all_moves([3,3])