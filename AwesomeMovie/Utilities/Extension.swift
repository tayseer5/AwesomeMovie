//
//  Extentiosn.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerNib<T: UICollectionViewCell>(_ cellClass: T.Type, bundle: Bundle? = nil){
        let identifier = String(describing: T.self)
        self.register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
    }
    
}
