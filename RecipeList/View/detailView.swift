//
//  detailView.swift
//  RecipeList
//
//  Created by Dingyi Kang on 4/19/21.
//

import SwiftUI

struct detailView: View {
    var rcp:recipe
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading){
               
                Image(rcp.image)
                    .resizable()
                    .scaledToFill()
                
                Text("\(rcp.name)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
                
                VStack(alignment: .leading){
                    Text("Ingredients").font(.headline)
                    .padding(.vertical, 3.0)
                ForEach(rcp.ingredients){ r in
                    
                    Text("• \(r.name)")
                    
                }
                }.padding(.horizontal)
                
                Divider()
                VStack(alignment: .leading){
                    Text("Directions").font(.headline)
                        .padding(.top, 3.0)
                ForEach(0..<rcp.directions.count){ r in
                    
                    Text("\(r+1). \(rcp.directions[r])")
                        
                }
                }.padding(.horizontal)
            }
            
        }
    }
}

struct detailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = viewModel()
        
        detailView(rcp: model.recipeList[0])
    }
}
