//
//  FavouriteCoordinatorOutput.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation

protocol FavouriteCoordinatorOutput{
    var finishFlow: (() -> Void)? { get set }
}
