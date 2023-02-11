//
//  MoviesAPI.swift
//  SoftExpertInterview
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation

protocol MoviesAPIProtocol {
    func getMostPopularMovie (pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void)
    func getTopRatedMovie (pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void)
}


class MoviesAPI: BaseAPI<RepositoriesNetworking>, MoviesAPIProtocol {
    func getMostPopularMovie(pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void) {
        self.fetchData(target: .mostPopularMovie(pageNumber: pageNumber), responseClass: MovieResponse.self) { (result) in
            completionHandler(result)
        }
    }
    
    func getTopRatedMovie(pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void) {
        self.fetchData(target: .topRatedMovie(pageNumber: pageNumber), responseClass: MovieResponse.self) { (result) in
            completionHandler(result)
        }
    }
}
