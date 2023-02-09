//
//  FavouriteCoordinator.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation

class FavouriteCoordinator: BaseCoordinator, FavouriteCoordinatorOutput {
    var finishFlow: (() -> Void)?
    private let factory:  FavouriteModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: RouterImp
    
    init(router: RouterImp, factory: FavouriteModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start(with option: DeepLinkOption? = nil){
        makeFavourite()
    }
    
    private func makeFavourite(with option: DeepLinkOption? = nil){
        let home = factory.makeFavouriteScreen()
        router.setRootModule(home)
    }
}
