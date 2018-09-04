//
//  ErrorService.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import Foundation
import Alamofire

public protocol APIErrorServise {
    
    func apiError(response: DataResponse<Data>) -> APIError
}

extension APIErrorServise {
    
    func apiError(response: DataResponse<Data>) -> APIError {
        
        guard let data = response.data else { fatalError("Api Error Data not exist") }
        guard let response = response.response else {
            return APIError(statusCode: 0, responseData: nil)
        }
        
        let apiError = APIError(statusCode: response.statusCode, responseData: data)
        return apiError
    }
}
