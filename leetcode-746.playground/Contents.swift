class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let size = cost.count
        if size < 2 {
            return 0
        }
        
        var dp : [Int] = Array.init(repeating: 0, count: size)
        dp[0] = cost[0]
        dp[1] = cost[1]
        for i in 2..<size {
            dp[i] = cost[i] + min(dp[i - 1], dp[i - 2])
        }
        return min(dp[size - 1], dp[size - 2])
    }
}
