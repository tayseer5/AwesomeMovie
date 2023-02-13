//
//  MovieDataFromUserDefult.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 13/02/2023.
//

import Foundation

class MovieDataFromUserDefult:BaseUserDefult, SaveMoviesRepositories,FeatchMoviesRepositories {
    //MARK: - SaveMoviesRepositories Confirmation
    func saveMovie(movie: Movie, completionHandler: @escaping (Result<Bool, NSError>) -> Void) {
        if let data = createDataToSave(movie: movie) {
            self.saveObject(key: userDefaultsKey.movie.rawValue, data: data)
        }
    }
    //MARK: - FeatchMoviesRepositories Confirmation
    func getMovie(sortType: SortType = .mostPopular, pageNumber: Int, completionHandler: @escaping (Result<MovieResponse, NSError>) -> Void) {
    }
    private func createDataToSave (movie: Movie) -> Data? {
        if var movies = getCurrentSavedData() {
            movies.append(movie)
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(movies)
                return data
            } catch {
                print("Unable to Encode Array of Notes (\(error))")
                return nil
            }
        } else {
            return nil
        }
    }
    private func getCurrentSavedData() -> [Movie]? {
        if let data = self.fetchObject(key: userDefaultsKey.movie.rawValue) {
            do {
                let decoder = JSONDecoder()
                var movies = try decoder.decode([Movie].self, from: data)
                return movies
                //movies.append(movie)
            } catch {
                print("Unable to Decode Notes (\(error))")
                return nil
            }
        }
        return nil
    }
    
}

enum userDefaultsKey: String {
    case movie
}
