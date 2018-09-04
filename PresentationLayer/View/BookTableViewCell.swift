//
//  BookTableViewCell.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!;
    @IBOutlet weak var createdAtLabel: UILabel!
    
    func prepareForDisplay(book: Book) {
        
        titleLabel.text = book.title
        authorLabel.text = book.author
        createdAtLabel.text = book.createAt
    }
}
