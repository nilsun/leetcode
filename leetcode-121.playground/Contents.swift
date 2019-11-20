class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = 0
        var maxSale = 0
        
        for i in 0..<prices.count {
            let price = prices[i]
            if i == 0 {
                minPrice = price
                continue
            }
            let sale = price - minPrice
            if maxSale < sale {
                maxSale = sale
            }
            if price < minPrice {
                minPrice = price
            }
        }
        return maxSale
    }
}
