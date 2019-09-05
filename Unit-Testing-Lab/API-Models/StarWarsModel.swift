//
//  StarWarsModel.swift
//  Unit-Testing-Lab
//
//  Created by Krystal Campbell on 8/30/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct StarWarsData: Codable {
    
    enum JSONError: Error {
        case decodingError(Error)
    }
    
    let results: [titleInfo]
    
    static func getStarWarsData(data: Data) throws ->
        [titleInfo] {
            do {
                let starWarsData = try JSONDecoder().decode(StarWarsData.self, from: data)
                
                return starWarsData.results
            }catch{
                throw JSONError.decodingError(error)
            }
    }
    
}

struct titleInfo: Codable {
    let movie: String
    let opening_crawl: String
}
