//
//  Joke.swift
//  Castor Canadensis
//
//  Created by Connor Groen on 2023-08-02.
//

import Foundation

struct Joke: Codable {
    let status: Int
    let response: String
    let joke: String
    let type: String
}
