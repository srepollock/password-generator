//
//  SecondViewController.swift
//  Generate App
//
//  Created by Spencer Pollock on 2018-07-12.
//  Copyright © 2018 spollock. All rights reserved.
//

import UIKit

class AboutApplicationViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMail(_ sender: Any) {
        let email = "spencer@spollock.ca"
        if let url = URL(string: "mailto:\(email)" + "?subject=Password Generator Reply") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    @IBAction func openWebsite(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "http://www.spollock.ca")! as URL)
    }
    @IBAction func writeReview(_ sender: Any) {
        // TODO: Change XXX.. to application id
        guard let writeReviewURL = URL(string: "https://itunes.apple.com/app/idXXXXXXXXXX?action=write-review")
            else { fatalError("Expected a valid URL") }
        UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
    }
}

