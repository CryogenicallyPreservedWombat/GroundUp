//
//  main.swift
//  GroundUp
//
//  Created by Etan Ossip on 3/3/21.
//

import Foundation

func next(_ value: UInt) -> UInt {
    var bit: UInt = 1
    var x = value
    while bit & x != 0 {
        x ^= bit
        bit <<= 1
    }
    x |= bit
    return x
}

func add(_ value1: UInt, _ value2: UInt) -> UInt {
    var ans: UInt = 0
    var (x, y) = (value1, value2)
    
    var carry: UInt = 0
    var bit: UInt = 0
    
    while (x | y | carry) != 0 {
        ans |= ((x & 1) ^ (y & 1) ^ carry) << bit
        carry = ((x & 1) & (y & 1)) | ((carry) & (x & 1)) | ((carry) & (y & 1))
        
        bit = next(bit)
        
        x >>= 1
        y >>= 1
    }
    
    return ans
}

func multiply(_ value1: UInt, _ value2: UInt) -> UInt {
    var ans: UInt = 0
    var (x, y) = (value1, value2)
    
    var counter: UInt = 0
    
    while x != 0 {
        if x & 1 != 0 { ans = add(ans, y << counter) }
        counter = next(counter)
        x >>= 1
    }
    
    return ans
}

func exponentiate(_ value1: UInt, _ value2: UInt) -> UInt {
    var ans: UInt = 1
    var (x, y) = (value1, value2)
    
    var multiplier: UInt = 0
    
    while (x & 1) == 0 {
        multiplier = next(multiplier)
        x >>= 1
    }
    
    var counter: UInt = 0
    while (counter ^ y) != 0 {
        counter = next(counter)
        ans = multiply(ans, x)
    }
    
    return ans << multiply(multiplier, y)
}
