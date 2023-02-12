//
//  CoordinatorFactory.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 08/02/2023.
//

import Foundation
import UIKit

protocol CoordinatorFactory {
    func makeTabCoordiantor() -> (Coordinator & TabCoordinatorOutput, toPresent: Presentable?)
    func makeHomeCoordinator(navController: UINavigationController?) -> Coordinator & HomeCoordinatorOutput
    func makeFavouriteCoordinator(navController: UINavigationController?) -> Coordinator & FavouriteCoordinatorOutput
}
