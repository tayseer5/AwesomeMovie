//
//  ModuleFactoryImplementation.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 08/02/2023.
//

import Foundation
final class ModuleFactoryImplementation:HomeModuleFactory,FavouriteModuleFactory {
    func makeHomeScreen() -> HomeView {
        let vc = HomeMovieViewController.controllerFromStoryboard(.main)
        vc.viewModel = HomeMovieViewModel(fetchMoviesDataUseCaseProtocol: FetchMoviesDataUseCase(moviesRepositories: MoviesAPI()))
        return vc
    }
    
    func makeFavouriteScreen() -> FavouriteView {
        let vc = FavouriteViewController.controllerFromStoryboard(.main)
        return vc
    }
    
    
}
