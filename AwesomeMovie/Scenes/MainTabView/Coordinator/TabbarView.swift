//
//  TabbarView.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 08/02/2023.
//
import UIKit
protocol TabbarView: AnyObject {
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
    var onFavouriteFlowSelect: ((UINavigationController) -> ())? { get set }
    var onMovieFlowSelect: ((UINavigationController) -> ())? { get set }
    
}
