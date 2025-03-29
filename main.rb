require_relative "lib/play"

def test_win_conditions
    board = Board.new
    puts board.full? # Should return false (board is empty)

    board.board[:a1] = 'X'
    board.board[:a2] = 'O'
    board.board[:a3] = 'X'
    board.board[:b1] = 'O'
    board.board[:b2] = 'X'
    board.board[:b3] = 'O'
    board.board[:c1] = 'X'
    board.board[:c2] = 'O'
    board.board[:c3] = 'X'

    puts board.full? # Should return true (board is full)
end


def start_game
    start = Play.new
    start.move
end

start_game