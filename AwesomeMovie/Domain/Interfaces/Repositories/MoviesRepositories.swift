//
//  MoviesRepositories.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 11/02/2023.
//

import Foundation

protocol MoviesRepositories {
    func getMovie (sortType: SortType, pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void)
    //func getTopRatedMovie (pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void)
}
