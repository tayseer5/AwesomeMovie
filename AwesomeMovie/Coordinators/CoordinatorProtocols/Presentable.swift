//
//  Presentable.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 07/02/2023.
//
/**
 It is made for flexibility and as well as abstraction. We can create a module as complicated as we want, but it is necessary to extract UIViewController for the router’s usage. It does not matter which approach the module will use for getting this controller.

 */
import Foundation
import UIKit

protocol Presentable{
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable{
    func toPresent() -> UIViewController? {
        return self
    }
}
