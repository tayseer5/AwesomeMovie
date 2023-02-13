//
//  FeatchMoviesRepositories.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 11/02/2023.
//

import Foundation

protocol FeatchMoviesRepositories {
    func getMovie (sortType: SortType, pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void)
}
