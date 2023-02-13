//
//  SaveMoviesRepositories.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 13/02/2023.
//

import Foundation

protocol SaveMoviesRepositories {
    func saveMovie (movie: Movie, completionHandler: @escaping (Result<Bool, NSError>) -> Void)
}
