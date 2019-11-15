public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    var ret : [[Int]] = [[Int]]()
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return [];
        }
        levelTravel([root!])
        return ret;
    }
    
    func levelTravel(_ nodes: [TreeNode]) {
        if nodes.count == 0 {
            return
        }
        var children = [TreeNode]()
        var levelValues = [Int]()
        
        for node in nodes {
            levelValues.append(node.val)
            if let left = node.left {
                children.append(left)
            }
            if let right = node.right {
                children.append(right)
            }
        }
        ret.append(levelValues)
        levelTravel(children)
    }
}
