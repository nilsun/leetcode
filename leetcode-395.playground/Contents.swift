class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        return find(s, k, 0, s.count - 1);
    }
    
    func find(_ s: String, _ k: Int, _ left: Int, _ right: Int) -> Int  {
        if left > right {
            return 0
        }
        
        var charDict = [Character : [Int]]()
        var index = 0;
        for c in s.subString(left, right - left + 1) {
            if charDict[c] == nil {
                charDict[c] = []
            }
            charDict[c]!.append(left + index)
            index += 1
        }
        
        for c in charDict.keys {
            let count = charDict[c]!.count;
            if  count > 0 && count < k {
                let pos = charDict[c]![0]
                return max(find(s, k, left, pos - 1), find(s, k, pos + 1, right))
            }
        }
        
        return right - left + 1;
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

let s = Solution();
s.longestSubstring("aaabb", 3)

