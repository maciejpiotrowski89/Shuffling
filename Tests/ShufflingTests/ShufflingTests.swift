import XCTest
@testable import Shuffling

final class GeneratorStub: RandomNumberGenerator {
    var randomSequence: [UInt64] = Array(1...10)
    public  func next() -> UInt64 {
        return randomSequence.removeFirst()
    }
}

final class ShufflingTests: XCTestCase {
    static var allTests = [("testShuffle1Element", testShuffle1Element)]
    
    var shuffler: Shuffler!
    var generator: GeneratorStub!

    override func setUp() {
        super.setUp()
        generator = GeneratorStub()
        shuffler = Shuffler(randomNumberGenerator: generator)
    }
    
    override func tearDown() {
        super.tearDown()
        shuffler = nil
        generator = nil
    }
    
    //MARK: Random numbers within bounds
    
    func testShuffle1Element() {
        //Given
        let collection = [1]
        let expected = collection
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
    }
    
    func testShuffle2Elements_1() {
        //Given
        let collection = [1, 2]
        generator.randomSequence = [0, 0, 0]
        let expected = [2, 1]
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
    }
    
    func testShuffle2Elements_2() {
        //Given
        let collection = [1, 2]
        generator.randomSequence = [1, 1, 1]
        let expected = [1, 2]
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
    }
    
    func testShuffle5Elements_1() {
        //Given
        let collection = [1, 2, 3, 4, 5]
        generator.randomSequence = [3, 3, 4, 0, 0, 0]
        let expected = [2, 1, 3, 5, 4]
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
        
    }
    
    func testShuffle5Elements_2() {
        //Given
        let collection = [1, 2, 3, 4, 5]
        generator.randomSequence = [3, 2, 3, 4, 1, 0]
        let expected = [1, 2, 5, 3, 4]
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
        
    }
    
    func testShuffle5Elements_3() {
        //Given
        let collection = [1, 2, 3, 4, 5]
        generator.randomSequence = [1, 2, 3, 4, 4]
        let expected = [1, 5, 4, 3, 2]
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
    }
    
    
    //MARK: Random numbers outside bounds
    
    func testShuffle1ElementWhenRandomNumbersAreOutsideArrayBounds() {
        //Given
        let collection = [1]
        generator.randomSequence = [1, 2, 3]
        let expected = collection
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
    }
    
    func testShuffle2ElementsWhenRandomNumbersAreOutsideArrayBounds_1() {
        //Given
        let collection = [1, 2]
        generator.randomSequence = [10, 10, 10]
        let expected = [2, 1]
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
    }
    
    func testShuffle2ElementsWhenRandomNumbersAreOutsideArrayBounds_2() {
        //Given
        let collection = [1, 2]
        generator.randomSequence = [11, 11, 11]
        let expected = [1, 2]
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
    }
    
    func testShuffle5ElementsWhenRandomNumbersAreOutsideArrayBounds_1() {
        //Given
        let collection = [1, 2, 3, 4, 5]
        generator.randomSequence = [13, 13, 14, 10, 10, 10]
        let expected = [2, 1, 3, 5, 4]
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
        
    }
    
    func testShuffle5ElementsWhenRandomNumbersAreOutsideArrayBounds_2() {
        //Given
        let collection = [1, 2, 3, 4, 5]
        generator.randomSequence = [13, 2, 13, 14, 1, 10]
        let expected = [1, 2, 5, 3, 4]
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
        
    }
    
    func testShuffle5ElementsWhenRandomNumbersAreOutsideArrayBounds_3() {
        //Given
        let collection = [1, 2, 3, 4, 5]
        generator.randomSequence = [11, 12, 13, 4, 14]
        let expected = [1, 5, 4, 3, 2]
        
        //When
        let shuffled = shuffler.shuffle(collection)
        
        //Then
        XCTAssertEqual(shuffled, expected)
    }
}
