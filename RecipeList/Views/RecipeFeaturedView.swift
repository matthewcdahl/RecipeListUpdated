//
//  RecipeFeaturedView.swift
//  RecipeList
//
//  Created by Matt Dahl on 12/13/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var showDetailView = false
    @State var selectedTagIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .font(Font.custom("Avenir Heavy", size: 24))
                .padding(.top, 40)
                
            
            GeometryReader{ geo in
                TabView(selection: $selectedTagIndex){
                    ForEach(0..<model.recipes.count){ i in
                        if(model.recipes[i].featured){
                            Button(action:{
                                showDetailView = true
                            }){
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color.white)
                                    VStack(spacing: 0){
                                        Image(model.recipes[i].image)
                                            .resizable()
                                            .clipped()
                                        Text(model.recipes[i].name)
                                            .padding(10)
                                            .font(.title3)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            .sheet(isPresented: $showDetailView){
                                RecipeDetailView(recipe: model.recipes[i], fromList: false)
                            }
                            
                            .frame(width: geo.size.width-40, height: geo.size.height - 100)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.7), radius: 10, x: -5, y:5)
                            .tag(i)
                                
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preparation Time:")
                    .bold()
                    .font(Font.custom("Avenir", size: 20))
                Text(model.recipes[selectedTagIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .bold()
                    .font(Font.custom("Avenir", size: 20))
                Text(model.recipes[selectedTagIndex].getHighlightsString())
                    .font(Font.custom("Avenir", size: 15))
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform:{
            findFirstFeatured()
        })
    }
    
    func findFirstFeatured(){
        let index = model.recipes.firstIndex{ (recipe) -> Bool in
            return recipe.featured
        }
        
        selectedTagIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
