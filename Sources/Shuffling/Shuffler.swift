public class Shuffler {
    
    var random: RandomNumberGenerator
    
    public init(randomNumberGenerator: RandomNumberGenerator) {
        self.random = randomNumberGenerator
    }
    
    public convenience init() {
        self.init(randomNumberGenerator: StandardRandomNumberGenerator())
    }
    
    /// Method uses provided random number generator and Fisher-Yates algorithm.
    ///The modern version of the Fisher–Yates shuffle, designed for computer use, was introduced by Richard Durstenfeld in 1964[2] and popularized by Donald E. Knuth in The Art of Computer Programming as "Algorithm P (Shuffling)".[3] Neither Durstenfeld's article nor Knuth's first edition of The Art of Computer Programming acknowledged the work of Fisher and Yates; they may not have been aware of it. Subsequent editions of Knuth's The Art of Computer Programming mention Fisher and Yates' contribution.[4]
    ///The algorithm described by Durstenfeld differs from that given by Fisher and Yates in a small but significant way. Whereas a naive computer implementation of Fisher and Yates' method would spend needless time counting the remaining numbers in step 3 above, Durstenfeld's solution is to move the "struck" numbers to the end of the list by swapping them with the last unstruck number at each iteration. This reduces the algorithm's time complexity to O(n), compared to O(n2) for the naïve implementation.[5] This change gives the following algorithm (for a zero-based array).
    ///
    ///-- To shuffle an array a of n elements (indices 0..n-1):
    ///     for i from n−1 downto 1 do
    ///         j ← random integer such that 0 ≤ j ≤ i
    ///         exchange a[j] and a[i]
    ///
    ///An equivalent version which shuffles the array in the opposite direction (from lowest index to highest) is:
    ///
    ///-- To shuffle an array a of n elements (indices 0..n-1):
    ///     for i from 0 to n−2 do
    ///         j ← random integer such that i ≤ j < n
    ///         exchange a[i] and a[j]
    ///
    /// Taken from: https://en.wikipedia.org/wiki/Fisher–Yates_shuffle
    ///
    /// - Parameter collection: A collection of elements to be shuffled
    /// - Returns: Shuffled collection
    public func shuffle<T>(_ collection:[T]) -> [T] {
        var shuffled = collection
        var i = collection.count - 1
        while i > 0 {
            let j = Int(random.next()) % collection.count
            if j <= i {
                shuffled.swapAt(i, j)
            }
            i -= 1
        }
        return shuffled
    }
}
