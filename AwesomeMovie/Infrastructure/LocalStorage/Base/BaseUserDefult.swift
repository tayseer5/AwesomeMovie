//
//  BaseUserDefult.swift
//  AwesomeMovie
//
//  Created by tayseer anwar on 13/02/2023.
//

import Foundation

class BaseUserDefult {
    func fetchObject(key:String) -> Data?{
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        return data
    }
    func saveObject(key:String,data: Data) {
        UserDefaults.standard.set(data, forKey: key)
    }
}
