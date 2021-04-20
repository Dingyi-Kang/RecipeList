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
    
}
