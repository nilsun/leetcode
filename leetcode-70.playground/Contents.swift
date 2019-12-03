class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        var dp : [Int] = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
}
