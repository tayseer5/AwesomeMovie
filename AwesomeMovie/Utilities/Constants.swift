//
//  Constants.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 10/02/2023.
//

import Foundation
//http://image.tmdb.org/t/p/w185/3bhkrj58Vtu7enYsRolD1fZdja1.jpg
//http://api.themoviedb.org/3/movie/popular?api_key=76277347eaed8f1535c8babcfd49c1a7
//http://api.themoviedb.org/3/movie/top_rated?api_key=76277347eaed8f1535c8babcfd49c1a7



//MARK: Network Constaints
enum BaseUrl: String {
    case baseUrl = "https://api.themoviedb.org/3/"
    case baseImageUrl = "https://image.tmdb.org/t/p/"
}
enum APIKeys: String {
    case apiKeyV1 = "76277347eaed8f1535c8babcfd49c1a7"
}
enum EndPoints: String {
    case movieList = "movie/"
}
enum Param: String {
    case imageDimention = "w185"
    case topRated = "top_rated"
    case popular = "popular"
    case apiKey = "api_key"
    case page = "page"
    
}
enum SortType {
    case mostPopular
    case topRated
}
enum HexColors: String {
    case grayshGreen = "#12303F"
}
