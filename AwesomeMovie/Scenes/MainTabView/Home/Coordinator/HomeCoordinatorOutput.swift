//
//  HomeCoordinatorOutput.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation

protocol HomeCoordinatorOutput{
    var finishFlow: (() -> Void)? { get set }
}
