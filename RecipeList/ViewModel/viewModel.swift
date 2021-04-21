//
//  viewModel.swift
//  RecipeList
//
//  Created by Dingyi Kang on 4/19/21.
//

import Foundation


class viewModel: ObservableObject{
    
    @Published var recipeList = [recipe]()
    
    init() {
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        if let path = pathString{
            
            let url = URL(fileURLWithPath: path)
            do{
            let data = try Data(contentsOf: url)
            
                let decode = JSONDecoder()
                
                recipeList = try decode.decode([recipe].self, from: data)
                
                for r in recipeList{
                    r.id = UUID()
                    for p in r.ingredients{
                        p.id = UUID()
                    }
                }
                
            }
            catch{print(error)}
        }
        
    }
    
    func returnHighLights(r: recipe) -> String{
        var str = r.highlights![0]
        for p in (1..<r.highlights!.count) {
            str += "/ "+r.highlights![p]
        }
        return str
    }
    
    static func getPortion(r: ingredient, servings: Int, targetServings: Int) -> String{
        
        var portion = ""
        
        var wholePortion = 0
        
        var numerator = r.num ?? 1
        
        var denominator = r.denom ?? 1
        
        let serving = servings
        
        if r.num != nil {
            
            denominator *= serving
            
            numerator *= targetServings
            
            let divisor = Rational.GCD(numerator, denominator)
            
            numerator /= divisor
            
            denominator /= divisor
            
            if numerator >= denominator {
                wholePortion = numerator/denominator
                numerator %= denominator
                portion += String(wholePortion)+" "
            }
            
            if numerator > 0 {
                portion += "\(numerator)/\(denominator) "
            }
            
        }
        
     
        
        if var unit = r.unit {

            if wholePortion > 1 {
                if unit.suffix(2)=="ch"{
                    unit += "es"
                }

                else if unit.suffix(1) == "f"{
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else{
                    unit += "s"
                }
            }

            return portion+"\(unit)"
        }
        else {
            return portion}
    }
    
}
