//
//  RepositoriesNetworking.swift
//  SoftExpertInterview
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation
import Alamofire

//MARK: Movie repositories for getting movie data from API
enum RepositoriesNetworking {
    case mostPopularMovie(pageNumber: Int)
    case topRatedMovie(pageNumber: Int)
}

extension RepositoriesNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return BaseUrl.baseUrl.rawValue
        }
    }
    
    var path: String {
        switch self {
        case .mostPopularMovie:
            return EndPoints.movieList.rawValue + Param.popular.rawValue
        case .topRatedMovie:
            return EndPoints.movieList.rawValue + Param.topRated.rawValue
        }
    }
    
    var method: HTTPMethod {
        switch self {
            default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .mostPopularMovie(let pageNumber):
            let parameters:[String:Any] = [Param.page.rawValue: pageNumber]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .topRatedMovie(let pageNumber):
            let parameters:[String:Any] = [Param.page.rawValue: pageNumber]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
}


