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
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }

        let left = root!.left
        let right = root!.right

        var rootChildValid = false
        if left != nil || right != nil {
            if left != nil && right != nil {
                rootChildValid = left!.val < root!.val && right!.val > root!.val
            } else if left != nil {
                rootChildValid = left!.val < root!.val
            } else {
                rootChildValid = right!.val > root!.val
            }
            if !rootChildValid {
                return false
            }
        }

        var rootRightGrandsonValid = true
        var rightLeft = right?.left
        while rightLeft != nil {
            rootRightGrandsonValid = rightLeft!.val > root!.val
            if !rootRightGrandsonValid {
                return false
            }
            rightLeft = rightLeft?.left
        }

        var rootLeftGrandsonValid = true
        var leftRight = left?.right
        while leftRight != nil {
            rootLeftGrandsonValid = leftRight!.val < root!.val
            if !rootLeftGrandsonValid {
                return false
            }
            leftRight = leftRight?.right
        }

        let leftTreeValid = isValidBST(left)
        let rightTreeValid = isValidBST(right)

        if !leftTreeValid || !rightTreeValid {
            return false
        }
        return true
    }
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBSTWithLowerAndUpper(root, lower: Int.min, upper: Int.max)
    }

    func isValidBSTWithLowerAndUpper(_ root: TreeNode?, lower : Int, upper : Int) -> Bool {
        if root == nil {
            return true
        }
        let val = root!.val
        if lower != Int.min && val <= lower {
            return false
        }
        if upper != Int.max && val >= upper {
            return false
        }

        if !isValidBSTWithLowerAndUpper(root?.right, lower: val, upper: upper) {
            return false
        }
        if !isValidBSTWithLowerAndUpper(root?.left, lower: lower, upper: val) {
            return false
        }

        return true
    }
}

let root = TreeNode(2)
let left = TreeNode(1)
let right = TreeNode(3)
root.left = left
root.right = right
let valid = Solution().isValidBST(root)

