//
//  SecondViewController.swift
//  Generate App
//
//  Created by Spencer Pollock on 2018-07-12.
//  Copyright © 2018 spollock. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var regenerateButton: UIButton!
    public var length: UInt32 = 0;
    public var capitals: UInt32 = 0;
    public var numbers: UInt32 = 0;
    public var characters: UInt32 = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        passwordText.text = createPassword();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func regeneratePressedDown(_ sender: Any) {
        passwordText.text = createPassword();
    }
    
    func createPassword() -> String {
        var password: String = "";
        let special = "!@#$%^&*()_+=,.<>/\\|?"
        let letters = "abcdefghijklmnopqrstuvwxyz"
        var cur: Int = -1
        var cap_count = 0
        var spec_count = 0
        var num_count = 0
        for _ in 0...length {
            cur = Int(arc4random_uniform(3) + 1)
            switch(cur) { // TODO: This isn't working
            case 1: // Lowercased letter
                let randomNum = Int(arc4random_uniform(UInt32(letters.count)))
                let randomIndex = letters.index(letters.startIndex, offsetBy: randomNum)
                let newCharacter = String(letters[randomIndex])
                password += String(newCharacter)
                break;
            case 2: // Capital letter
                if (cap_count <= capitals) {
                    cap_count += 1
                    let randomNum = Int(arc4random_uniform(UInt32(letters.count)))
                    let randomIndex = letters.index(letters.startIndex, offsetBy: randomNum)
                    let newCharacter = String(letters[randomIndex]).uppercased()
                    password += String(newCharacter)
                    break;
                }
            case 3: // Special character
                if (spec_count <= characters) {
                    spec_count += 1
                    let randomNum = Int(arc4random_uniform(UInt32(special.count)))
                    let randomIndex = letters.index(special.startIndex, offsetBy: randomNum)
                    let newCharacter = special[randomIndex]
                    password += String(newCharacter)
                    break;
                }
            case 4: // Number characters
                if (num_count <= numbers) {
                    num_count += 1
                    let randomNum = Int(arc4random_uniform(9))
                    password += String(randomNum)
                }
                break;
            default: break;
            }
        }
        return password
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

