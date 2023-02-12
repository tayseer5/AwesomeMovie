//
//  Coordinator.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 07/02/2023.
//

import Foundation

protocol Coordinator: AnyObject{
    func start()
    func start(with option: DeepLinkOption?)
}
