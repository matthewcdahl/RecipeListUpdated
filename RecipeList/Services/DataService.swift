//
//  DataService.swift
//  RecipeList
//
//  Created by Matt Dahl on 12/8/21.
//

import Foundation

class DataService{
    
    
    static func getLocalData() ->[Recipe]{
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else{
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            let recipes = try decoder.decode([Recipe].self, from: data)
            
            for r in recipes{
                r.id = UUID()
                for i in r.ingredients{
                    i.id = UUID()
                }
            }
            
            return recipes
            
        }
        catch{
            print(error)
        }
        
        return [Recipe]()
        
    }
}
