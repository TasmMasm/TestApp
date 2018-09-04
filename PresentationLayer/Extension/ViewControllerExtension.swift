//
//  ViewControllerExtension.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    internal func showAlert(title: String?, message: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    internal func showError(_ error: Error) {

        if let apiError = error as? APIError {
            showAlert(title: apiError.message, message: nil)
        } else {
            showAlert(title: error.localizedDescription, message: nil)
        }
    }
}
