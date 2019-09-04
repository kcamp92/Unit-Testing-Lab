//
//  TriviaModel.swift
//  Unit-Testing-Lab
//
//  Created by Krystal Campbell on 8/30/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct TriviaData: Codable {
    
    enum JSONError: Error {
        case decodingError(Error)
    }
    
    let results: [resultsInfo]
    
    static func getTriviaData(data: Data) throws ->
        [resultsInfo] {
            do {
                let triviaData = try JSONDecoder().decode(TriviaData.self, from: data)
                
                return triviaData.results
            }catch{
                throw JSONError.decodingError(error)
            }
    }
    
}

struct resultsInfo: Codable {
    let name: String
    let correctAnswer: String
    let incorrect_answers: [String]
}

