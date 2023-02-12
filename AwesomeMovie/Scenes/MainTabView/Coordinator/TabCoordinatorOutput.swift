//
//  TabCoordinatorOutput.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 08/02/2023.
//

import Foundation

protocol TabCoordinatorOutput {
    var finishFlow: (() -> Void)? { get set }
}
