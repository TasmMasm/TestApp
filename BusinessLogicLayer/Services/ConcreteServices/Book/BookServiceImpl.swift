//
//  BookServiceImpl.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

class BookServiceImpl: BookService {

    func get() -> Promise<[Book]?> {
        return Promise {seal in
            request("https://hn.algolia.com/api/v1/search_by_date?tags=story",
                    method: .get,
                    parameters: ["page": 0],
                    encoding: URLEncoding.default,
                    headers: nil)
                .validate()
                .responseData(completionHandler: { response in
                    
                    switch response.result {
                    case .success:
                        if let data = response.data {
                                do {
                                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                        let jsonArray = json["hits"] as? [[String: Any]]
                                        seal.fulfill(handleResposeJsonArray(json: jsonArray))
                                    } else {
                                        seal.reject(self.apiError(response: response))
                                    }
                            } catch let error {
                                seal.reject(error)
                            }
                        } else {
                            seal.reject(self.apiError(response: response))
                        }
                        
                    case .failure:
                        seal.reject(self.apiError(response: response))
                    }
                })
        }
    }
}
