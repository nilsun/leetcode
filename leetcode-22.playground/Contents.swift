class Solution {
    
    var ret : [String] = [String]()
    
    func generateParenthesis(_ n: Int) -> [String] {
        dfs(left: 0, right: 0, tmp: "", pairCount: n)
        return ret
    }
    
    func dfs(left : Int, right : Int, tmp : String, pairCount : Int) {
        if left == pairCount && right == pairCount {
            ret.append(tmp)
            return;
        }
        
        if left < pairCount {
            dfs(left: left + 1, right: right, tmp: tmp + "(", pairCount: pairCount)
        }
        
        if left > right && right < pairCount {
            dfs(left: left, right: right + 1, tmp: tmp + ")", pairCount: pairCount)
        }
    }
}
