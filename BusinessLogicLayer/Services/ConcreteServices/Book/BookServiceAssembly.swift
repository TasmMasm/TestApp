//
//  BookServiceAssembly.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import Foundation

class BookServiceAssembly {
    
    static func bookService() -> BookService {
        return BookServiceImpl()
    }
}
