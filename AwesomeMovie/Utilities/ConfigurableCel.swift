//
//  ConfigurableCel.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 11/02/2023.
//

import Foundation
import UIKit

protocol ConfigurableCell {
    static var reuseIdentifier: String { get }
    associatedtype DataType
    func configure(data: DataType, indexPath:IndexPath)
}

extension ConfigurableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
