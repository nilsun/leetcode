struct Heap <Element> {
    var elements : [Element]
    let priorityFunction: (Element, Element) -> Bool
    let equalFunction: (Element, Element) -> Bool
    
    init(elements : [Element] = [], priorityFunction : @escaping (Element, Element) -> Bool, equalFunction : @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        self.equalFunction = equalFunction
        buildHeap()
    }
    
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var count : Int {
        return elements.count
    }
    
    mutating func buildHeap() {
        for index in (0 ..< self.elements.count / 2).reversed() {
            siftDown(index)
        }
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return (index == 0)
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    mutating func equeue(_ element: Element) {
        elements.append(element)
        siftUP(elements.count - 1)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        
        swapElement(at: 0, with: count - 1)
        let pop = elements.popLast()
        defer {
            if !isEmpty {
                siftDown(0)
            }
        }
        return pop
    }
    
    mutating func dequeueElement(_ element: Element) {
        let index = elements.firstIndex(where: { equalFunction($0, element)})
        if let i = index {
            swapElement(at: i, with: count - 1)
            elements.popLast()
            
            let parent = parentIndex(of: i)
            if parent > 0 && parent < elements.count {
                if isHigherPriority(firstIndex: i, secondIndex: parent) {
                    siftUP(i)
                    return;
                }
            }
            siftDown(i)
        }
    }
}
private extension Heap {
    
    func isHigherPriority(firstIndex: Int, secondIndex: Int) -> Bool{
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(firstIndex: childIndex, secondIndex: parentIndex)
            else { return parentIndex }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func siftDown(_ elementIndex: Int) {
        let highestIndex = highestPriorityIndex(for : elementIndex)
        
        if highestIndex == elementIndex {
            return
        }
        swapElement(at: elementIndex, with: highestIndex)
        siftDown(highestIndex)
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
            else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
    
    mutating func siftUP(_ elementAtIndex: Int)  {
        let parentIndex = self.parentIndex(of: elementAtIndex)
        guard !isRoot(elementAtIndex), isHigherPriority(firstIndex: elementAtIndex, secondIndex: parentIndex) else {
            return
        }
        swapElement(at: elementAtIndex, with: parentIndex)
        siftUP(parentIndex)
    }
}

class Solution {
    var heap : Heap<Int>
    
    init() {
        self.heap = Heap<Int>(elements: [], priorityFunction : >, equalFunction : ==)
    }
    
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > 0 else {
            return []
        }
        guard k >= 1 && k <= nums.count else {
            return []
        }
        
        self.heap = Heap<Int>(elements : Array(nums[0..<k]), priorityFunction : >, equalFunction : ==)
        var maxValues : [Int] = []
        for i in 0...(nums.count - k) {
            if i == 0 {
                maxValues.append(self.heap.peek()!)
                continue
            }
            let dequeue = i - 1
            let enqueue = dequeue + k
            self.heap.dequeueElement(nums[dequeue])
            self.heap.equeue(nums[enqueue])
            maxValues.append(self.heap.peek()!)
        }
        return maxValues
    }
}

