//
//  RecipeTabView.swift
//  RecipeList
//
//  Created by Matt Dahl on 12/10/21.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            VStack{
                Text("Featured View goes here")
                Button(action: {
                    selectedTab = 1
                }, label: {
                    Text("Take me to tab 1")
                })
            }
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
                .tag(0)
            RecipeListView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("All")
                }
                .tag(1)
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
