//
//  Movie.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 11/02/2023.
//

import Foundation

//MARK: Movie Response
struct MovieResponse: Codable {
    var page: Int?
    var movie: [Movie]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case movie = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
// MARK: Movie Object
struct Movie: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
