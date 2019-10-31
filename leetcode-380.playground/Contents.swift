class RandomizedSet {
    
    var dataDict : [Int : Int]
    
    init() {
        dataDict = [Int : Int]()
    }
    
    func insert(_ val: Int) -> Bool {
        if dataDict[val] == nil {
            dataDict[val] = val
            return true
        } else {
            return false
        }
    }
    
    func remove(_ val: Int) -> Bool {
        let ret = dataDict.removeValue(forKey: val)
        if ret == nil {
            return false
        }
        return true
    }
    
    func getRandom() -> Int {
        let randomIndex = Int.random(in: 0...(dataDict.keys.count - 1))
        let randomKey = ([Int](dataDict.keys))[randomIndex]
        return dataDict[randomKey]!
    }
}
