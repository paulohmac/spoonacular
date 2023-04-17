//
//  NetWorkDispatcher.swift
//  SpoonacularPaulo
//
//  Created by Paulo H.M. on 02/11/22.
//

import Moya
import UIKit

protocol Dispatcher {

    var recipes  : [Recipe]? { get set }

    var randomRecipe  : Recipe? { get set }

    var error : String { get set }

    func findRecipes(query : String)
    
    func findRandomRecipe()

}

class NetWorkDispatcher : ObservableObject, Dispatcher {
    
    @Published var recipes  : [Recipe]?
    @Published var randomRecipe  : Recipe?
    @Published var error  = ""
    
    private let appKey =  "336f4185e30f45dbb2ec56a2f36df171"

    init(){
    }
    
    internal func findRecipes(query : String){
        let provider = MoyaProvider<SpoonacularTarget>()
        provider.request(.search(query: query)){ response in
            do {
                switch response {
                case .success(let response):
                    let recipesReturned = try JSONDecoder().decode([Recipe].self, from: response.data)
                    self.recipes = recipesReturned
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            } catch {
                self.error = error.localizedDescription
            }
        }
    }

    internal func findRandomRecipe(){
        let provider = MoyaProvider<SpoonacularTarget>()
        provider.request(.random){ response in
            do {
                switch response {
                case .success(let response):
                    let recipeReturned = try JSONDecoder().decode(Recipe.self, from: response.data)
                    self.randomRecipe = recipeReturned
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            } catch {
                self.error = error.localizedDescription
            }
        }
    }

    
    
    
}


