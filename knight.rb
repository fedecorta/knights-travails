class Solution
    def valid_move?(x, y)
        x.between?(0, 7) && y.between?(0, 7)
    end

    def knight_moves(start_coordinates, end_coordinates)
        possible_moves = [[1,2],[2,1],[-1,-2],[-2,-1],[-1,2],[1,-2],[-2,1],[2,-1]]
        visited_positions = { start_coordinates => true }
        queue = [[start_coordinates,[start_coordinates]]]

        until queue.empty?
            current, path = queue.shift
            if current == end_coordinates
                moves_count = path.length-1
                puts "You made it in #{moves_count} moves! Here's your path:"
                path.each {|move| p move}
                return path
            end

            possible_moves.each do |x,y|
                next_move = [current[0] + x, current[1] + y]
                next unless valid_move?(next_move[0],next_move[1]) && !visited_positions.key?(next_move)

                visited_positions[next_move] = true
                new_path = path + [next_move]
                queue.push([next_move,new_path])
            end
        end
    end
end

solution = Solution.new
solution.knight_moves([3,3],[4,3])
