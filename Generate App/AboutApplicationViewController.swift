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
        guard let url = URL(string: "mailto:" + email + "?subject=Password%20Generator%20Reply") else {
            fatalError("Did not create URL")
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @IBAction func openWebsite(_ sender: Any) {
        guard let url = URL(string: "http://www.spollock.ca")
            else { fatalError("Expected a valid URL") }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @IBAction func writeReview(_ sender: Any) {
        // TODO: Change XXX.. to application id
        guard let writeReviewURL = URL(string: "https://itunes.apple.com/app/idXXXXXXXXXX?action=write-review")
            else { fatalError("Expected a valid URL") }
        UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
    }
}

