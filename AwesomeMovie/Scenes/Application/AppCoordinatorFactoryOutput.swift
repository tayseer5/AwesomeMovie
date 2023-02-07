//
//  CoordinatorFactoryOutPut.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 07/02/2023.
//

import Foundation

protocol AppCoordinatorFactoryOutput{
    var finishFlow: (() -> Void)? { get set }
}
