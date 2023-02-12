//
//  TargetType.swift
//  SoftExpertInterview
//
//  Created by tayseer anwar on 09/02/2023.
//

import Foundation
import Alamofire

enum HTTPMethod: String {
    case get = "GET"
}
enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

protocol TargetType {
    
    var baseURL: String {get}
    
    var path: String {get}
    
    var method: HTTPMethod {get}
    
    var task: Task {get}
    
    var headers: [String: String]? {get}
}
