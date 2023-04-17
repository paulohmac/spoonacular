//
//  SpoonacularTarget.swift
//  SpoonacularPaulo
//
//  Created by Paulo H.M. on 01/11/22.
//
import Moya

enum SpoonacularTarget: TargetType, Equatable {
    case search(query : String)
    case random
}

extension SpoonacularTarget {
    
    public var baseURL: URL {
        return URL(string: SpoonacularTargetConfiguration.baseUrl) ?? URL(string: "")!
    }
    
    public var path: String {
        switch self {
        case .search: return SpoonacularTargetConfiguration.Path.searchPath
        case .random: return SpoonacularTargetConfiguration.Path.randomPath
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .search, .random: return SpoonacularTargetConfiguration.Method.search
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .search(let query):
            return SpoonacularTarget.createSearchMap(term: query)
        case .random:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        return SpoonacularTargetConfiguration.Headers.search
    }
    
    static func createSearchMap(term : String)->Task{
        return .requestParameters(parameters: ["query": term], encoding: JSONEncoding.default)
    }

}

internal struct SpoonacularTargetConfiguration{
    static var baseUrl = "https://api.spoonacular.com/recipes/"
    struct Path{
        static var searchPath = "/api/search/"
        static var randomPath = "recipes/random?number=1"
    }
    
    struct Method{
        static var search = Moya.Method.get
    }
    
    struct Task{
        static var search = SpoonacularTarget.createSearchMap(term: "abacaxi")
    }

    struct Headers{
        static var search = ["Content-Type": "application/json"]
    }
    
    struct RequestParameter{
        static var search = ["Content-Type": "application/json"]

    }
    
    
}
