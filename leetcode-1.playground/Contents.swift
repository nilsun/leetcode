class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var numDict = [Int: Int]()
        var index = 0
        for num in nums {
            numDict[num] = index
            index = index + 1
        }
        
        var ret = [Int]()
        index = 0
        for num in nums {
            let pairNum = target - num
            
            if let pairIndex = numDict[pairNum] {
                if pairIndex != index {
                    ret.append(index)
                    ret.append(pairIndex)
                    return ret
                }
            }
            index = index + 1
        }
        
        return []
    }
}
