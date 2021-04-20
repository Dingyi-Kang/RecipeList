//
//  ContentView.swift
//  RecipeList
//
//  Created by Dingyi Kang on 4/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = viewModel()
    var body: some View {
        
        TabView{
            featureView()
                .tabItem{
                    HStack{
                    Image(systemName:"star.fill")
                    Text("Feature")
                    }
                    }
            
            ListView()
                .tabItem{
                    HStack{
                    Image(systemName:"list.bullet")
                    Text("List")
                    }
                    
                }
            
        }.environmentObject(viewModel())

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
