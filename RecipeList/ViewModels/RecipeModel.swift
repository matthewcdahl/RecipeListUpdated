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
    
    func getHighlightsString(index: Int)->String{
        var toRtn = ""
        for h in recipes[index].highlights {
            toRtn += h + ", "
        }
        
        return String(toRtn.dropLast(2))
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String{
        
        var portion: String = ""
        
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0

        if(ingredient.num != nil){
            
            denominator *= recipeServings
            numerator *= targetServings
            
            let divisor = getGreatestCommonDivisor(num: numerator,denom: denominator)
            denominator /= divisor
            numerator /= divisor
            
            if(numerator > denominator){
                wholePortions = numerator / denominator
                numerator = numerator % denominator
            }
            
            if(wholePortions > 0){
                portion += String(wholePortions) + " "
            }
            
            if(numerator == 1 && denominator == 1){
                portion += "1 "
            }
            else if(numerator > 0){
                portion += String(numerator) + "/" + String(denominator) + " "
            }
            
            if(ingredient.unit == "To taste"){
                portion += "To taste"
            } else if(ingredient.unit != nil){
                if numerator == 1 && denominator == 1 && ingredient.unit != nil{
                    portion += ingredient.unit! + " "
                }
                else if ingredient.unit != nil{
                    portion += ingredient.unit! + "s "
                }
            }

            
        }
        else{
            portion += "To taste "
        }
        
        
        
        return portion
    }
    
    static func getGreatestCommonDivisor(num: Int, denom: Int) -> Int{
        var largestCommon = 0
        for i in 1...num{
            if(num % i == 0 && denom % i == 0){
                largestCommon = i
            }
        }
        return largestCommon
    }
    
}
