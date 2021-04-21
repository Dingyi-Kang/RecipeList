//
//  greatestCommonDivisor.swift
//  RecipeList
//
//  Created by Dingyi Kang on 4/20/21.
//

import Foundation

struct Rational {
    
    static func GCD (_ a: Int, _ b: Int) -> Int{
        
        if a == 0{
            return b
        }
        
        if b == 0{
            return a
        }
        
        return GCD(b, a % b)
        
    }
}
