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
    
    override func start(with option: DeepLinkOption?) {
        runMainFlow()
    }
    private func runMainFlow() {
        
    }
}
