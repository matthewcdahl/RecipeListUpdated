//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Matt Dahl on 12/8/21.
//

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
    
    init(){
        //parse json, but will handle it in the services folder
        self.recipes = DataService.getLocalData()
    }
    
}
