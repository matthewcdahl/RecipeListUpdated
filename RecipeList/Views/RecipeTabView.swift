//
//  RecipeTabView.swift
//  RecipeList
//
//  Created by Matt Dahl on 12/10/21.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            Text("Featured View goes here")
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            RecipeListView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("All")
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
