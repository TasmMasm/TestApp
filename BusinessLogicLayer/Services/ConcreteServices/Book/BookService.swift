//
//  BookService.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import Foundation
import PromiseKit

protocol BookService: APIErrorServise {
    
    func get(pagination: Pagination) -> Promise<[Book]?>
}
