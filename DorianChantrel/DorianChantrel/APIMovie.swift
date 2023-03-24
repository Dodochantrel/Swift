//
//  APIMovie.swift
//  DorianChantrel
//
//  Created by Cours on 24/03/2023.
//

import Foundation

struct APIMovie: Codable {
    
    let id: Int
    let title: String
    let description: String
    let imagePath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description = "overview"
        case imagePath = "poster_path"
    }
}

struct MoviePopularResults: Codable {
    let page: Int
    let results: [APIMovie]
}
