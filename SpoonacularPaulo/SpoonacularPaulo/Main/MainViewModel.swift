//
//  ViewModel.swift
//  SpoonacularPaulo
//
//  Created by Paulo H.M. on 04/11/22.
//

import UIKit
import Combine

class MainViewModel {

    @Published var randomRecipe : Recipe?
    @Published var error : String = ""
    @Published var showError : Bool = false
    @Published var isLoadingPage = true
    
    private var network : NetWorkDispatcher?
    
    private var cancellable: AnyCancellable?
    
    init(){
        self.network = NetWorkDispatcher()

        cancellable = network?.$randomRecipe
            .sink { result in
                print("got result: \(result)")
                self.randomRecipe = result
            }
    }
    
    public func getRandomRecipe(){
        isLoadingPage = true
        guard let network else{
            return
        }

        network.findRandomRecipe()
    }
    
    
}
