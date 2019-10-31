class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ret = [Int]()
        if root == nil {
            return ret
        }
        traversal(root, valArray: &ret)
        return ret
    }
    func traversal(_ root: TreeNode?, valArray : inout [Int]) {
        if root == nil {
            return
        }
        let right = root!.right
        let left = root!.left
        if left != nil {
            traversal(left, valArray: &valArray)
        }
        valArray.append(root!.val)
        if right != nil {
            traversal(right, valArray: &valArray)
        }
    }
}

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ret = [Int]()
        if root == nil {
            return ret
        }
        
        var stack = [TreeNode]()
        var curNode = root
        while curNode != nil || stack.count != 0 {
            while curNode != nil {
                stack.append(curNode!)
                curNode = curNode!.left
            }
            curNode = stack.popLast()
            ret.append(curNode!.val)
            curNode = curNode!.right
        }
        return ret
    }
}
