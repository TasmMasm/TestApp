//
//  Pagination.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import Foundation

public protocol Pagination {
    
    var page: Int { get set }
    var isFetchingData: Bool { get set }
    
    func toJSON() -> [String: Any]
}

class PaginationImpl: Pagination {

    var page: Int = 0
    var isFetchingData: Bool = true
    
    func toJSON() -> [String : Any] {
        
        var json: [String: Any] = [String: Any]()
        json["page"] = page
        
        return json
    }
}

class PaginationAssamble {
    
    static func pagination() -> Pagination {
        return PaginationImpl()
    }
}
