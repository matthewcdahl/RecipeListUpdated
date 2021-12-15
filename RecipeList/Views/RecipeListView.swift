//
//  ContentView.swift
//  RecipeList
//
//  Created by Matt Dahl on 12/8/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("All Recipes")
                    .bold()
                    .font(.largeTitle)
                    .padding(.top, 40)
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(model.recipes){ r in
                            NavigationLink(destination:{
                                RecipeDetailView(recipe: r, fromList: true)
                            } ,label: {
                                HStack(spacing: 20){
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment: .leading){
                                        Text(String(r.name))
                                            .foregroundColor(.black)
                                            .bold()
                                        Text(r.getHighlightsString())
                                            .foregroundColor(.black)
                                        
                                    }
                                }
                            })
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}
