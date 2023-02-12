//
//  BaseAPI.swift
//  SoftExpertInterview
//
// Created by tayseer anwar on 09/02/2023.
//

import Foundation
import Alamofire

//MARK: BASRAPI featch data respnse also creating and buid request
class BaseAPI<T:TargetType> {
    //TODO: need inhance
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completionHandler:@escaping (Result<M, NSError>)-> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParams(task: target.task)
        
        /**
         -[NSError init] called; this results in an invalid NSError instance. It will raise an exception in a future release. Please call errorWithDomain:code:userInfo: or initWithDomain:code:userInfo:. This message shown only once.
         */
        AF.request(target.baseURL + target.path, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).responseData { (response) in
            switch response.result{
            case .success(let value):
                    guard let responseObj = try? JSONDecoder().decode(M.self, from: value) else {
                        print("responseObj error")
                        completionHandler(.failure(NSError()))
                        return
                    }
                    completionHandler(.success(responseObj))
            case .failure(let error):
                let errorMessage = "error with status code \(response.response?.statusCode ?? 0), request \(String(describing: response.request)) and error \(error)"
                let userInfo = ["Error Message" :  errorMessage]
                let err = NSError(domain: "Error in responce ", code: error.responseCode ?? 500, userInfo: userInfo)
                completionHandler(.failure(err))
            }
        }
    }
    
    private func buildParams(task: Task) -> ([String: Any], ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([Param.apiKey.rawValue:APIKeys.apiKeyV1.rawValue], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            var newParams = parameters
            newParams[Param.apiKey.rawValue] = APIKeys.apiKeyV1.rawValue
            return (newParams, encoding)
        }
    }
    
    
}
