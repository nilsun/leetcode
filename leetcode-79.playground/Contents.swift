class Solution {
    
    let direction : [[Int]] = [[-1, 0], [0, -1], [0, 1], [1, 0]]
    var marked = [[Bool]]()
    var board = [[Character]]()
    var row : Int = 0
    var col : Int = 0
    var word : String = ""
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        row = board.count
        if row == 0 {
            return false
        }
        col = board[0].count
        marked = Array(repeating: Array(repeating: false, count: col), count: row)
        self.word = word
        self.board = board
        
        for i in 0..<row {
            for j in 0..<col {
                if backtrack(i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func backtrack(_ r : Int, _ c : Int, _ index : Int) -> Bool{
        if !validateFirst(r, c, index) {
            return false
        }
        if !validateNext(r, c, index) {
            marked[r][c] = false
        } else {
            return true
        }
        return false
    }
    
    func validateFirst(_ r : Int, _ c : Int, _ index : Int) -> Bool {
        let strChar = Character(word.subString(index, 1))
        let boradChar = board[r][c]
        if strChar == boradChar {
            marked[r][c] = true
        }
        return marked[r][c]
    }
    
    func validateNext(_ r : Int, _ c : Int, _ index : Int) -> Bool {
        if (index == word.count - 1) {
            return true
        }
        
        for d in 0..<4 {
            let newR = r + direction[d][0]
            let newC = c + direction[d][1]
            if inArea(newR, newC) && !marked[newR][newC] {
                if backtrack(newR, newC, index + 1) {
                    return true
                }
            }
        }
        return false
    }
    
    func inArea(_ r : Int, _ c : Int) -> Bool {
        return r >= 0 && r < row && c >= 0 && c < col
    }
}

extension String {
    func subString(_ start : Int, _ length : Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
}
