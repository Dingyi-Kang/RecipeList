//
//  ListView.swift
//  RecipeList
//
//  Created by Dingyi Kang on 4/19/21.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var model:viewModel
    //@ObservedObject var model = viewModel()

    
    var body: some View {
        
        //        VStack(alignment: .leading){
        //            Text("All Recipe").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.leading)
        
        NavigationView{
            
            List(model.recipeList){ r in
                NavigationLink(
                    destination: detailView(rcp: r),
                    label: {
                        HStack(spacing: 0.0){
                            Image(r.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .cornerRadius(12.0)
                            VStack{
                                Text(r.name)
                                    .padding(.leading)
                            }
                        }
                })
   
            }.navigationTitle("All Recipe")
                
        //}
            
        
        }
     
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
