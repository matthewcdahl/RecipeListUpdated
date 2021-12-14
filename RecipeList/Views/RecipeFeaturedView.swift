//
//  RecipeFeaturedView.swift
//  RecipeList
//
//  Created by Matt Dahl on 12/13/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .font(.largeTitle)
                .padding(.top, 40)
                
            
            GeometryReader{ geo in
                TabView{
                    ForEach(0..<model.recipes.count){ i in
                        if(model.recipes[i].featured){
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
                                }
                            }
                            .frame(width: geo.size.width-40, height: geo.size.height - 100)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.7), radius: 10, x: -5, y:5)
                                
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preparation Time:")
                    .bold()
                Text("1 Hour")
                Text("Highlights")
                    .bold()
                Text("Hearty, Healthy")
            }
            .padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
