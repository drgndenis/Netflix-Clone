//
//  Title.swift
//  Netflix Clone
//
//  Created by Denis DRAGAN on 19.07.2023.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    
    let id: Int
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let mediaType: String?
    let releaseDate: String?
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
            case id
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview
            case posterPath = "poster_path"
            case mediaType = "media_type"
            case releaseDate = "release_date"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
    }
}
