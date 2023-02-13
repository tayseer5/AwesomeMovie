//
//  MoviesAPI.swift
//  SoftExpertInterview
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation

class MovieDataFromAPIs: BaseAPI<RepositoriesNetworking>, FeatchMoviesRepositories {
    //MARK: - featch Movie
    //MARK: FeatchMoviesRepositories Confirmation
    func getMovie(sortType: SortType, pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void) {
        switch sortType {
        case .mostPopular:
            getMostPopularMovie(pageNumber: pageNumber, completionHandler: completionHandler)
        case .topRated :
            getTopRatedMovie(pageNumber: pageNumber, completionHandler: completionHandler)
        default :
            getMostPopularMovie(pageNumber: pageNumber, completionHandler: completionHandler)
        }
    }
    //MARK: Private funcation to get movie from api
    private func getMostPopularMovie(pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void) {
        self.fetchData(target: .mostPopularMovie(pageNumber: pageNumber), responseClass: MovieResponse.self) { (result) in
            completionHandler(result)
        }
    }
    private func getTopRatedMovie(pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void) {
        self.fetchData(target: .topRatedMovie(pageNumber: pageNumber), responseClass: MovieResponse.self) { (result) in
            completionHandler(result)
        }
    }
}
