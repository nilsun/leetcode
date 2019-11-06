class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        var numCountDict = [Int : Int]()
        var arrayDict = [String : Int]()
        var ret = [[Int]]()
        
        for num in nums {
            if let count = numCountDict[num] {
                numCountDict[num] = count + 1
            } else  {
                numCountDict[num] = 1
            }
        }
        
        for i in 0..<nums.count {
            if (i + 1 >= nums.count - 1) {
                continue
            }
            let num1 = nums[i]
            for j in (i + 1)..<nums.count {
                let num2 = nums[j]
                let num3 = -(num1 + num2)
                if var num3Count = numCountDict[num3] {
                    if num1 == num3 {
                        num3Count = num3Count - 1
                    }
                    if num2 == num3 {
                        num3Count = num3Count - 1
                    }
                    if num3Count > 0 {
                        let array = [num1, num2, num3].sorted(by: <)
                        let arrayIdentifier = String(num1) + "," + String(num2) + "," + String(num3)
                        if arrayDict[arrayIdentifier] == nil {
                            arrayDict[arrayIdentifier] = 1
                            ret.append(array)
                        }
                    }
                }
            }
        }
        return ret;
    }
}
