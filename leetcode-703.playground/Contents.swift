struct Heap <Element> {
    var elements : [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    init(elements : [Element] = [], priorityFunction : @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
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
        siftUP(elementAtIndex: elements.count - 1)
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
    
    mutating func siftUP(elementAtIndex: Int)  {
        let parentIndex = self.parentIndex(of: elementAtIndex)
        guard !isRoot(elementAtIndex), isHigherPriority(firstIndex: elementAtIndex, secondIndex: parentIndex) else {
            return
        }
        swapElement(at: elementAtIndex, with: parentIndex)
        siftUP(elementAtIndex: parentIndex)
    }
}

class KthLargest {
    var heap : Heap<Int>
    let k : Int
    
    init(_ k : Int, _ nums : [Int]) {
        self.heap = Heap<Int>(elements: nums, priorityFunction : <)
        self.k = k
        
        while heap.count > k {
            heap.dequeue()
        }
    }
    
    func add(_ val : Int) -> Int {
        if heap.count == k {
            if val > heap.peek()! {
                heap.dequeue()
                heap.equeue(val)
            }
        } else {
            heap.equeue(val)
        }
        return heap.peek()!
    }
}
