//
//  structOfData.swift
//  RecipeList
//
//  Created by Dingyi Kang on 4/19/21.
//

import Foundation

class recipe: Identifiable, Decodable {
    
    var id:UUID?
    
    var name:String
    var featured:Bool
    var image:String
    
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    
    var highlights:[String]?
    
    var ingredients: [ingredient]
    var directions: [String]
   
}

class ingredient: Identifiable, Decodable{
    
    var id:UUID?
    
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
