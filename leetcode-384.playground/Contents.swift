import Foundation

class Solution {

    private var rNum : [Int];
    private var sNum : [Int];
    
    init(_ nums: [Int]) {
        rNum = nums
        
        sNum = [Int]()
        for i in nums {
            sNum.append(i)
        }
    }
    
    func reset() -> [Int] {
        return rNum
    }
    
    func shuffle() -> [Int] {
        if sNum.count <= 1 {
            return sNum
        }
        
        for i in 0...(sNum.count - 1) {
            let originIndex = sNum.count - 1 - i;
            var swapIndex : Int
            if originIndex == 0 {
                swapIndex = 0
            } else {
                swapIndex = Int.random(in: 0...originIndex)
            }
            let tmp = sNum[originIndex];
            sNum[originIndex] = sNum[swapIndex]
            sNum[swapIndex] = tmp
        }
        return sNum
    }
}

//let obj = Solution(["Solution","shuffle","reset","shuffle"])
//let ret_1: [Int] = obj.reset()
//let ret_2: [Int] = obj.shuffle()
