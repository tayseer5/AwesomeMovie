//
//  RouterFactory.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 07/02/2023.
//
/**
 separated router 1) for single responsiblty to makecoordinator manages flow but it is never responsible for routing.
 2) we could either support iPad or add custom screen transitions. Coordinator will never know about it, as it can continue to use the router’s protocol interfaces, like “push”, and not care about new transition animation. The implementation details of push is up to the router. As a result, we can create a composition of router classes for different devices, like iPhone, iPad, TV, or Watch, and have them conform to one general protocol.
 https://medium.com/blacklane-engineering/coordinators-essential-tutorial-part-i-376c836e9ba7
 */

import Foundation

protocol RouterFactory: Presentable {
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, hideBottomBar: Bool)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?)
    func popModule()
    func popModule(animated: Bool)
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    func popToRootModule(animated: Bool)
}
