//
//  featureView.swift
//  RecipeList
//
//  Created by Dingyi Kang on 4/20/21.
//

import SwiftUI

struct featureView: View {
    
    @State var index = 3
    
    @EnvironmentObject var model:viewModel
    
    @State var isDetailViewShowing = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 20)
                .font(.largeTitle)
            
            GeometryReader{ geo in
                TabView(selection: $index,
                        content:  {
                            
                            ForEach(0..<model.recipeList.count){ i in
                                
                                let r = model.recipeList[i]
                                
                                if r.featured == true{
                                    
                                    Button(action: {
                                        
                                        self.isDetailViewShowing = true
                                        
                                    }, label: {
                                        ZStack{
                                            
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .tag(i)
                                            VStack{
                                                Image(r.image)
                                                    .resizable()
                                                    .scaledToFill()
                                                Text(r.name)
                                                    .padding(.top, 5)
                                                    .padding(.bottom, 10)
                                            }
                                        }
                                    })
                                    .sheet(isPresented: $isDetailViewShowing){
                                        detailView(rcp: model.recipeList[i])
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .frame(width: geo.size.width-50, height: geo.size.height-150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(13.0)
                                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x:-3, y:3)
                                }
                                
                            }
                            
                            
                            
                            
                        })
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preparation Time:")
                    .font(.headline)
                
                Text(model.recipeList[index].prepTime)
                
                
                if model.recipeList[index].highlights != nil {
                    Text("Hightlights:")
                        .font(.headline)
                    
                    Text(model.returnHighLights(r: model.recipeList[index]))
                    
                }
                
            }.padding(.leading)
            .padding(.bottom)
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
        
    }
    
    
    func setFeaturedIndex(){
        let index2 = model.recipeList.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
            
        index = index2 ?? 0
        
    }
    
}

struct featureView_Previews: PreviewProvider {
    static var previews: some View {
        featureView()
    }
}
