//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Matt Dahl on 12/9/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var recipe: Recipe
    @State var selectedIndex: Int = 2
    var fromList: Bool
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack(alignment: .leading){
                
                    //MARK: Image
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                    
                    Text(recipe.name)
                        .font(.largeTitle)
                        .padding([.leading, .bottom])
                    
                    //MARK: Picker
                    Text("Pick your serving size")
                        .font(.title3)
                        .padding(.horizontal)
                    Picker("Servings", selection: $selectedIndex){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 240, height: 20, alignment: .leading)
                    .padding([.leading, .bottom])

                    
                    //MARK: Ingredients
                    VStack(alignment: .leading){
                        Text("Ingredients")
                            .font(.headline)
                            .padding(.all, 3)
                        ForEach(recipe.ingredients){ i in
                            Text("• " + RecipeModel.getPortion(ingredient: i, recipeServings: recipe.servings, targetServings: selectedIndex) + i.name)
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
                    
                    if(fromList){
                        HStack{
                            Text("Featured")
                            Toggle("Featured", isOn: $recipe.featured).labelsHidden()
                        }
                        .padding()
                    }
                }
                
                
                
            }
        }
        
    }
    

}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //create a dummy recipe for testing
        
        let recipe = DataService.getLocalData()[0]
        NavigationView{
            RecipeDetailView(recipe: recipe, fromList: true)
        }
    }
}
