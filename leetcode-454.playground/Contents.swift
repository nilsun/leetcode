class Solution {
    func fourSumCount(_ A : [Int], _ B : [Int], _ C : [Int], _ D : [Int]) -> Int {
        var count = 0
        var sumDict = [Int : Int]()
        
        for a in A {
            for b in B {
                let sum = a + b
                if let abSumCount = sumDict[sum] {
                    sumDict[abSumCount] = abSumCount + 1
                } else {
                    sumDict[abSumCount] = 1
                }
            }
        }
        
        for c in C {
            for d in D {
                let sum = -(c + d)
                if let cdSumCount = sumDict[sum] {
                    count += cdSumCount
                }
            }
        }
        return count
    }
}
