//
//  JokeModel.swift
//  Unit-Testing-Lab
//
//  Created by Krystal Campbell on 8/30/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct JokeData: Codable {
    let setup: String
    let punchline: String
    
    enum JSONError: Error {
        case decodingError(Error)
    }
    
    static func getJokeData(data: Data) throws ->
        [JokeData] {
            do {
                let jokeData = try JSONDecoder().decode([JokeData].self, from: data)
                
                return jokeData
            }catch{
                throw JSONError.decodingError(error)
            }
    }
    
}




