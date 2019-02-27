//
//  StandardRandomNumberGenerator.swift
//  Shuffling
//
//  Created by Maciej Piotrowski on 27/2/19.
//

import Foundation

public class StandardRandomNumberGenerator: RandomNumberGenerator {
    public  func next() -> UInt64 {
        return UInt64(arc4random())
    }
}
