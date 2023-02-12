//
//  MainTabController.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation
import UIKit

enum MovieTabs: Int {
    case home = 0
    case favourite = 1
}


final class MainTabController: UITabBarController,TabbarView {
    var onViewDidLoad: ((UINavigationController) -> ())?
    var onFavouriteFlowSelect: ((UINavigationController) -> ())?
    var onMovieFlowSelect: ((UINavigationController) -> ())?
    var currentSelectedIndex: MovieTabs = .home
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        if let controller = customizableViewControllers?.first as? UINavigationController {
             onViewDidLoad?(controller)
           }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = currentSelectedIndex.rawValue
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension MainTabController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        switch selectedIndex {
        case MovieTabs.home.rawValue :
            onMovieFlowSelect?(controller)
        case MovieTabs.favourite.rawValue :
            onFavouriteFlowSelect?(controller)
        default :
            onMovieFlowSelect?(controller)
        }
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if selectedIndex == 1 {
            print("\(selectedIndex)")
        }
    }
}
