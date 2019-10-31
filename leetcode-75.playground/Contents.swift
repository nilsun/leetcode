class Solution {
    func sortColors(_ nums: inout [Int]) {
        var p0 = 0
        var cur = 0
        var p2 = nums.count - 1
        
        var tmp = 0
        while cur <= p2 {
            if nums[cur] == 0 {
                tmp = nums[p0]
                nums[p0] = nums[cur]
                nums[cur] = tmp
                p0 += 1
                cur += 1
            } else if (nums[cur] == 2) {
                tmp = nums[cur]
                nums[cur] = nums[p2]
                nums[p2] = tmp
                p2 -= 1
            } else {
                cur += 1
            }
        }
    }
}
