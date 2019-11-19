class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        if n == 1 {
            return x
        }
        if n == -1 {
            return 1 / x
        }
        let half = myPow(x, n / 2)
        let rest = myPow(x, n % 2)
        return rest * half * half
    }
}
