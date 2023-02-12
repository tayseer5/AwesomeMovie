//
//  HomeMovieViewModel.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation

//MARK: - viewModel protocol Input
protocol HomeMovieViewModelInput {
    func resetData()
    func viewDidLoad()
    func didLoadNextPage()
    func didSelectItem(at index: Int)
    func changeSort(sortType:SortType)
    func getNumberOfData() -> Int
    func getDataForIndex(_ index : Int) -> Movie?
}
//MARK: - viewModel protocol Output
protocol HomeMovieViewModelOutput {
    var dataLoaded : ( () -> Void)? { get set}
    var showErrorMessage : ( (_ message: String) -> Void)? { get set}
}
//MARK: - viewModel
class HomeMovieViewModel :HomeMovieViewModelOutput {
    //MARK: private enity
    private let fetchMoviesDataUseCaseProtocol: FetchMoviesDataUseCaseProtocol
    private var pageNumber = 1
    private var totalResult = 0
    private var sortType: SortType = .mostPopular
    private var movies :[Movie] = []
    //MARK: CallBacks
    var dataLoaded : ( () -> Void)?
    var showErrorMessage: ((String) -> Void)?
    //MARK: init
    init(fetchMoviesDataUseCaseProtocol: FetchMoviesDataUseCaseProtocol ) {
        self.fetchMoviesDataUseCaseProtocol = fetchMoviesDataUseCaseProtocol
    }
    //MARK: private Helping Function
    private func getMovie(sortType: SortType,pageNumber: Int) {
        fetchMoviesDataUseCaseProtocol.getMovie(sortType: sortType, page: pageNumber) {[weak self] isDone, errorMessgae, response in
            if isDone {
                self?.movies.append(contentsOf: response?.movie ?? [] )
                self?.totalResult = response?.totalResults ?? 0
                self?.dataLoaded?()
            } else {
                self?.showErrorMessage?(errorMessgae)
            }
        }
    }
}
//MARK: - viewModel protocol Input extention
extension HomeMovieViewModel: HomeMovieViewModelInput {
    func getNumberOfData() -> Int {
        movies.count
    }
    
    func getDataForIndex(_ index: Int) -> Movie? {
        if movies.count > index {
            return movies[index]
        } else {
            return nil
        }
    }
    
    func resetData() {
        self.pageNumber = 1
        self.sortType = .mostPopular
        movies.removeAll()
        getMovie(sortType: sortType, pageNumber: pageNumber)
    }
    func viewDidLoad() {
        movies.removeAll()
        getMovie(sortType: sortType, pageNumber: pageNumber)
    }
    
    func didLoadNextPage() {
        pageNumber += 1
        getMovie(sortType: sortType, pageNumber: pageNumber)
    }
    
    func didSelectItem(at index: Int) {
        
    }
    
    func changeSort(sortType: SortType) {
        self.pageNumber = 1
        self.sortType = sortType
        movies.removeAll()
        getMovie(sortType: sortType, pageNumber: pageNumber)
    }
    
    
}
