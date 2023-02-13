//
//  FetchMoviesData.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 11/02/2023.
//

import Foundation
//TODO: final class ??
protocol FetchMoviesDataUseCaseProtocol {
    func getMovie(sortType: SortType, page: Int, completion: @escaping(_ isDone: Bool,_ errorMsg: String,_ data: MovieResponse?)-> Void)
}
class FetchMoviesDataUseCase: FetchMoviesDataUseCaseProtocol {
    private let moviesRepositories: FeatchMoviesRepositories
    init(moviesRepositories: FeatchMoviesRepositories){
        self.moviesRepositories = moviesRepositories
    }
    
    func getMovie(sortType: SortType, page: Int, completion: @escaping (Bool, String, MovieResponse?) -> Void) {
        moviesRepositories.getMovie(sortType:sortType,pageNumber: page) { result in
            print("getMostPopularMovie")
            print(result)
            switch result {
            case .success(let data):
                completion(true,"",data)
                break;
            case .failure(let error):
                completion(false,error.localizedDescription,nil)
                break
            }
        }
    }
    
}
