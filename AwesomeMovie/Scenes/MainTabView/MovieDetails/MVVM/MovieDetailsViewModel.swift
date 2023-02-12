//
//  MovieDetailsViewModel.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 12/02/2023.
//

import Foundation


//MARK: - viewModel protocol Input
protocol MovieDetailsViewModelInput {
    func addToFavourite()
    func getData() -> Movie
}
//MARK: - viewModel protocol Output
protocol MovieDetailsViewModelOutput {
    
}
class MovieDetailsViewModel : MovieDetailsViewModelOutput {
    //MARK: - private var
    private var movie: Movie
    init(movie: Movie) {
        self.movie = movie
    }
    
}
//MARK: - MovieDetailsViewModelInput Extention
extension MovieDetailsViewModel: MovieDetailsViewModelInput {
    func addToFavourite() {
        
    }
    
    func getData() -> Movie {
        return movie
    }
    
    
}
