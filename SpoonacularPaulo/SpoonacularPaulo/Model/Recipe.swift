//
//  Recipe.swift
//  SpoonacularPaulo
//
//  Created by Paulo H.M. on 02/11/22.
//

import UIKit

struct Recipe: Codable, Identifiable {
    let id : Int?
    let title : String?
    let image : String?
    let extendedIngredients : [ExtendedIngredients]
    
    struct ExtendedIngredients : Codable {
        let aisle : String?
        let amount : Float?
        let image : String?
        let name : String?
        let unit : String?
    }
}
