//
//  AppCoordinator.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 07/02/2023.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator,AppCoordinatorFactoryOutput {
    var finishFlow: (() -> Void)?
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: RouterFactory
    private let moduleFactory: ModuleFactoryImplementation
    
    init(router: RouterFactory,coordinatorFactory: CoordinatorFactory, moduleFactory: ModuleFactoryImplementation) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.moduleFactory = moduleFactory
    }
    override func start() {
        runTabFlow()
    }
    private func runTabFlow(){
        //Contains viewController
        var (coordinator, module) = coordinatorFactory.makeTabCoordiantor()
        coordinator.finishFlow = {[weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.start()
        }
        addDependecny(coordinator)
        router.setRootModule(module, hideBar: true)
        coordinator.start()
    }
}
