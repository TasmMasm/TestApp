//
//  RectExtension.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import UIKit

extension CGRect {
    
    public static var paginationViewFrame: CGRect {
        
        let width = UIScreen.main.bounds.width
        let height: CGFloat = 44
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        return frame
    }
}
