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
    @IBOutlet weak var copyToClipboardButton: UIButton!
    @IBOutlet weak var regenerateButton: UIButton!
    public var length: UInt32 = 0
    public var capitals: UInt32 = 0
    public var numbers: UInt32 = 0
    public var characters: UInt32 = 0
    private var cap_count = 0
    private var num_count = 0
    private var spc_count = 0
    private let letters: Array<String> = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    private let caps: Array<String> =  ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    private let nums: Array<String> = ["1","2","3","4","5","6","7","8","9","0"]
    private let spcs: Array<String> = ["!","@","#","$","%","^","&","*","(",")","_","-","+","=",",","<",".",">","/","?","[","{","]","}","\\","|"]
    
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
        cap_count = 0
        num_count = 0
        spc_count = 0
        var password: String = "";
        var count = 0;
        while (count < length) {
            let ch: Character = generateCharacter(random: Int(arc4random_uniform(3) + 1))
            password.append(ch)
            count += 1
        }
        return password
    }
    // TODO: This does not fill requirements. Needs to have all characters specified by the user
    func generateCharacter(random: Int) -> Character {
        var ch: Character = Character(letters[Int(arc4random_uniform(UInt32(letters.count)))])
        switch(random) {
        case 1:
            if (cap_count < capitals) {
                ch = Character(caps[Int(arc4random_uniform(UInt32(letters.count)))])
                cap_count += 1
                break
            }
        case 2:
            if (num_count < numbers) {
                ch = Character(nums[Int(arc4random_uniform(UInt32(nums.count)))])
                num_count += 1
                break
            }
        case 3:
            if (spc_count < characters) {
                ch = Character(spcs[Int(arc4random_uniform(UInt32(spcs.count)))])
                spc_count += 1
                break
            }
        default:
            break;
        }
        return ch;
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func copyPasswordToClipboard(_ sender: UIButton) {
        UIPasteboard.general.string = passwordText.text
        let alert = UIAlertController(title: "Copied to clipboard", message: "Please write this down somewhere safe", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated:true)
    }
}

