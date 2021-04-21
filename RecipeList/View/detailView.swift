//
//  detailView.swift
//  RecipeList
//
//  Created by Dingyi Kang on 4/19/21.
//

import SwiftUI

struct detailView: View {
    
    var rcp:recipe
    
    @State var selectionSize = 2
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading){
               
                Image(rcp.image)
                    .resizable()
                    .scaledToFill()
                
                Text("\(rcp.name)")
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .padding([.leading, .bottom])
                VStack(alignment: .leading){
                    Text("Selection your serving size:")
                        .padding(.leading)
                Picker("", selection: $selectionSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }
                .padding(.leading)
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 160.0, height: 40.0)
                }
                VStack(alignment: .leading){
                    Text("Ingredients").font(.headline)
                    .padding(.vertical, 3.0)
                ForEach(rcp.ingredients){ r in
                    
                    Text("• \(viewModel.getPortion(r:r, servings:rcp.servings,targetServings: selectionSize))\(r.name.lowercased())")
                    
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
