//
//  featureView.swift
//  RecipeList
//
//  Created by Dingyi Kang on 4/20/21.
//

import SwiftUI

struct featureView: View {
    @EnvironmentObject var model:viewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .font(.largeTitle)
                .padding(.leading)
                .padding(.top, 20)
                
            GeometryReader{ geo in
                TabView{
                    
                    ForEach(model.recipeList){ r in
                        if r.featured == true{
                            
                            ZStack{
                                
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack{
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                    Text(r.name)
                                        .padding(.top, 5)
                                        .padding(.bottom, 10)
                                }
                            }.frame(width: geo.size.width-50, height: geo.size.height-150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(13.0)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x:-3, y:3)
                        }
                        
                    }
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode:.always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preparation Time:")
                    .font(.headline)
                 
                Text(model.recipeList[0].prepTime)
                
                
                if model.recipeList[0].highlights != nil {
                    Text("Hightlights:")
                        .font(.headline)
                       
                    Text(model.recipeList[0].highlights![0])
                        
                }
                
            }.padding(.leading)
            .padding(.bottom)
        }
   
    }
}

struct featureView_Previews: PreviewProvider {
    static var previews: some View {
        featureView()
    }
}
