class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        let size = nums.count
        if size == 0 {
            return 0
        }
        var dpMax = Array.init(repeating: 0, count: size)
        var dpMin = Array.init(repeating: 0, count: size)
        dpMin[0] = nums[0]
        dpMax[0] = nums[0]
        var maxValue = nums[0]
        for i in 1..<size {
            dpMax[i] = max(dpMin[i - 1] * nums[i], max(dpMax[i - 1] * nums[i], nums[i]))
            dpMin[i] = min(dpMin[i - 1] * nums[i], min(dpMax[i - 1] * nums[i], nums[i]))
            maxValue = max(maxValue, dpMax[i])
        }
        return maxValue
    }
}
