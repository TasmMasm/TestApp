//
//  WebViewViewController.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    fileprivate func configure() {
    
        let webView = WKWebView(frame: view.frame)
        if let url = url {
            let request = URLRequest(url: url)
            webView.load( request )
        }
        
        view.addSubview( webView )
    }
}
