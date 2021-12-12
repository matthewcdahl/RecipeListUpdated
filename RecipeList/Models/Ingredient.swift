//
//  Ingredient.swift
//  RecipeList
//
//  Created by Matt Dahl on 12/12/21.
//

import Foundation

class Ingredient: Identifiable, Decodable{
    
    var id: UUID?
    var name: String
    var unit: String?
    var num: Int?
    var denom: Int?
    
}
