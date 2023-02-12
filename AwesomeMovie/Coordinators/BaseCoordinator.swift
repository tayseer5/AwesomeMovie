//
//  BaseCoordinator.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 07/02/2023.
//

import Foundation

class BaseCoordinator: Coordinator{
    
    
    //UINavigationController property handling by router in BaseCoordinator subclass (like app coordinator)
    
    // property to store all child coordinator
    var childCoordinators: [Coordinator] = []
    func start() {
        start(with: nil)
    }
    func start(with option: DeepLinkOption?) {}
    func addDependecny(_ coordinator: Coordinator){
        guard !childCoordinators.contains(where: {$0 === coordinator}) else{ return}
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?){
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else {return}
        
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty{
            coordinator.childCoordinators.filter({$0 !== coordinator}).forEach({coordinator.removeDependency($0)})
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
    
}
