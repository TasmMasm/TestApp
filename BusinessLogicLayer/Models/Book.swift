//
//  Book.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import Foundation
import Alamofire

public protocol Book {
    
    var id: String { get }
    var createAt: String { get }
    var title: String { get }
    var url: URL? { get }
    var author: String { get }
}

struct BookImpl: Book {
    
    var url: URL?
    var author: String
    var id: String
    var createAt: String
    var title: String
}

public func handleResposeJsonArray(json: [[String: Any]]?) -> [Book]? {
    
    if let jsonArray = json {
        return jsonArray.compactMap({ handleJsonResponce(json: $0) })
    }
    
    return nil
}

public func handleJsonResponce(json: [String: Any] ) -> Book? {
        
    if let id = json["objectID"] as? String,
        let createAtStr = json["created_at"] as? String,
        let title = json["title"] as? String,
        let urlStr = json["url"] as? String,
        let url = URL(string: urlStr),
        let author = json["author"] as? String {
        
        let createAt = createAtStr.toDate
        return BookImpl(url: url, author: author, id: id, createAt: createAt, title: title)
    }

    return nil
}

