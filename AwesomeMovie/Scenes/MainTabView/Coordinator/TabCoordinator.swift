//
//  TabCoordinator.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 08/02/2023.
//

import Foundation
import UIKit

class TabCoordinator: BaseCoordinator, TabCoordinatorOutput {
    var finishFlow: (() -> Void)?
    
    private let tabbarView: TabbarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    override func start() {
        tabbarView.onViewDidLoad = runMovieFlow()
        tabbarView.onMovieFlowSelect = runMovieFlow()
        tabbarView.onFavouriteFlowSelect = runFavouriteFlow()
    }
    
    private func runMovieFlow() -> ((UINavigationController) -> ()) {
       return { [unowned self] navController in
         if navController.viewControllers.isEmpty == true {
           let itemCoordinator = self.coordinatorFactory.makeHomeCoordinator(navController: navController)
             self.addDependecny(itemCoordinator)
           itemCoordinator.start()
         }
       }
     }
     
     private func runFavouriteFlow() -> ((UINavigationController) -> ()) {
       return { [unowned self] navController in
         if navController.viewControllers.isEmpty == true {
           let favouriteCoordinator = self.coordinatorFactory.makeFavouriteCoordinator(navController: navController)
             self.addDependecny(favouriteCoordinator)
             favouriteCoordinator.start()
         }
       }
     }
   }

