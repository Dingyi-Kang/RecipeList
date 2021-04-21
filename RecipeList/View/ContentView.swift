//
//  ContentView.swift
//  RecipeList
//
//  Created by Dingyi Kang on 4/19/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    @ObservedObject var model = viewModel()
    var body: some View {
        
        TabView{
            featureView()
                .tabItem{
                    HStack{
                    Image(systemName:"heart")
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
    init() {
        UITabBar.appearance().barTintColor = UIColor.gray
    }
    static var previews: some View {
        
        ContentView()
    }
}
