//
//  HomeModuleFactory.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation

protocol HomeModuleFactory {
    func makeHomeScreen() -> HomeView
    func makeMovieDetailsScreen (movie:Movie) -> MovieDetailsView
}

