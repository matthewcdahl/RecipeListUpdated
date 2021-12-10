//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Matt Dahl on 12/9/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack(alignment: .leading){
                
                    //MARK: Image
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()

                    
                    //MARK: Ingredients
                    VStack(alignment: .leading){
                        Text("Ingredients")
                            .font(.headline)
                            .padding(.all, 3)
                        ForEach(recipe.ingredients, id: \.self){ i in
                            Text("• " + i)
                                .padding(.bottom, 3)
                        }
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    //MARK: Directions
                    VStack(alignment: .leading){
                        Text("Directions")
                            .font(.headline)
                            .padding(.all, 3)
                        ForEach(0..<recipe.directions.count, id: \.self){ i in
                            Text(String(i+1) + ". " + recipe.directions[i])
                                .padding(.bottom, 3)
                        }
                    }
                    .padding(.horizontal)
                }
                
                
                
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //create a dummy recipe for testing
        
        let recipe = DataService.getLocalData()[0]
        NavigationView{
        RecipeDetailView(recipe: recipe)
        }
    }
}
