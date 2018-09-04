//
//  APIError.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import Foundation
import Alamofire

enum APIStatusCode: Int {
    case unknownError = 0
}

public class APIError: Error {
    
    var statusCode: Int!
    var message: String!
    var errors: String = ""
    
    init(statusCode: Int, responseData data: Data?) {
        
        self.statusCode = statusCode
        
        guard let data = data else {
            message = "Server is unavailable"
            return
        }
        
        do {
            let errorData = try JSONSerialization.jsonObject(with: data, options: [])
            if let json = errorData as? [String: Any] {
                
                print( json )
                message = json["message"] as? String
                
                if let errors = json["errors"] as? [String: Any] {
                    var tempArray: [String] = [String]()
                    errors.forEach { (_, value) in
                        if let arrayValue = value as? [String] {
                            tempArray.append(contentsOf: arrayValue)
                        }
                    }
                    
                    self.errors = tempArray.joined(separator: "\n")
                }
            }
        } catch let error {
            self.statusCode = 0
            self.message = "Server is unavailable"
            errors = error.localizedDescription
        }
    }
}
