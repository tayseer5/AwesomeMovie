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
    //MARK: - coordinator module creatour
    private func makeHome(with option: DeepLinkOption? = nil){
        var home = factory.makeHomeScreen()
        home.moveToDetails = { [weak self] movie in
            let vc = self?.factory.makeMovieDetailsScreen(movie: movie)
            self?.router.push(vc, hideBottomBar: true)
        }
        router.setRootModule(home)
    }
}
