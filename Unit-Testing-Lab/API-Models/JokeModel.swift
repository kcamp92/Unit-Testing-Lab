//
//  JokeModel.swift
//  Unit-Testing-Lab
//
//  Created by Krystal Campbell on 8/30/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct JokeData: Codable {
    
    enum JSONError: Error {
        case decodingError(Error)
    }
    
    let setup: [setupInfo]
    
    static func getJokeData(data: Data) throws ->
        [setupInfo] {
            do {
                let jokeData = try JSONDecoder().decode(JokeData.self, from: data)
                
                return jokeData.setup
            }catch{
                throw JSONError.decodingError(error)
            }
    }
    
}

struct setupInfo: Codable {
    let setup: String
    let punchline: String
}


