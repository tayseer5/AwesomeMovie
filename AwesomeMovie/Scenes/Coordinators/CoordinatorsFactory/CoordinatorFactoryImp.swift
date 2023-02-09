//
//  CoordinatorFactoryImp.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 08/02/2023.
//

import Foundation
import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    func makeTabCoordiantor() -> (Coordinator & TabCoordinatorOutput, toPresent: Presentable?) {
        let controller = MainTabController.controllerFromStoryboard(.main)
        let coordinator = TabCoordinator(tabbarView: controller, coordinatorFactory: CoordinatorFactoryImp())
        return (coordinator, controller)
    }
    func makeHomeCoordinator(navController: UINavigationController?) -> Coordinator & HomeCoordinatorOutput {
        let coordinator = HomeCoordinator(router: router(navController), factory: ModuleFactoryImplementation(), coordinatorFactory: CoordinatorFactoryImp())
        return coordinator
    }
    func makeFavouriteCoordinator(navController: UINavigationController?) -> Coordinator & FavouriteCoordinatorOutput {
        let coordinator = FavouriteCoordinator(router: router(navController), factory: ModuleFactoryImplementation(), coordinatorFactory: CoordinatorFactoryImp())
        return coordinator
        
    }
    private func router(_ navController: UINavigationController?) -> RouterImp {
        return RouterImp(rootController: navigationController(navController))
    }
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
      }
}
