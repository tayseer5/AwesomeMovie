//
//  UIViewControllerExtension.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 08/02/2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    private class func instantiateFromNib<T: UIViewController>() -> T {
        return T.init(nibName: String(describing: T.self), bundle: nil)
    }

    
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass)
    }
    
    class func controllerFromStoryboard(_ storyboard: Storyboards) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass)
    }
    class func loadFromNib() -> Self {
        return instantiateFromNib()
    }
    
}


enum Storyboards: String {
    case main = "Main"
}
