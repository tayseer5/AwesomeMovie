//
//  HomeView.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation


protocol HomeView: BaseView{
    var moveToDetails: ((_ movie: Movie) -> Void)? {get set}
}
