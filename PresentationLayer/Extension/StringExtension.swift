//
//  StringExtension.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import Foundation

extension String {
    
    var toDate: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)
        
        if date != nil {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            let dateShort = formatter.string(from: date!)
            
            return dateShort
        } else {
            return self
            
        }
    }
}
