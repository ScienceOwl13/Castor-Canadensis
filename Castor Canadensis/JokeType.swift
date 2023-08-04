//
//  JokeType.swift
//  Castor Canadensis
//
//  Created by Connor Groen on 2023-08-02.
//

import Foundation

enum JokeType: String, Codable, CaseIterable {
    case chucknorris = "Chuck Norris",
    dadjoke = "Dad Joke",
    random = "Random",
    yomama = "Yo Mama"
    
    var type: String {
        switch self {
            
        case .chucknorris:
            return "chucknorris"
        case .dadjoke:
            return "dadjoke"
        case .random:
            return "random"
        case .yomama:
            return "yomama"
        }
    }
}
