//
//  HomeCoordinator.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation

class HomeCoordinator: BaseCoordinator, HomeCoordinatorOutput {
    var finishFlow: (() -> Void)?
    private let factory:  HomeModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: RouterImp
    
    init(router: RouterImp, factory: HomeModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start(with option: DeepLinkOption? = nil){
        makeHome()
    }
    
    private func makeHome(with option: DeepLinkOption? = nil){
        let home = factory.makeHomeScreen()
        router.setRootModule(home)
    }
}
