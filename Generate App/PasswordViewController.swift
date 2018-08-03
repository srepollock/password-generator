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
    public var passwordLength: UInt32 = 0
    public var capitalsCount: UInt32 = 0
    public var numbersCount: UInt32 = 0
    public var charactersCount: UInt32 = 0
    private let _letterIndex: Array<String> = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    private let _capitalsIndex: Array<String> =  ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    private let _numberIndex: Array<String> = ["1","2","3","4","5","6","7","8","9","0"]
    private let _characterIndex: Array<String> = ["!","@","#","$","%","^","&","*","(",")","_","-","+","=",",","<",".",">","/","?","[","{","]","}","\\","|"]
    
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
        var password: String = "" // Final output
        var pArray = Array<String>()
        // Begin password loop
        let pArrayLength = (passwordLength - (capitalsCount + numbersCount + charactersCount))
        for _ in 0...pArrayLength-1 {
            pArray.append(_letterIndex[Int(arc4random_uniform(UInt32(_letterIndex.count)))])
        }
        if (capitalsCount != 0) {
            for _ in 0...capitalsCount-1 {
                pArray.append(_capitalsIndex[Int(arc4random_uniform(UInt32(_capitalsIndex.count)))])
            }
        }
        if (numbersCount != 0) {
            for _ in 0...numbersCount-1 {
                pArray.append(_numberIndex[Int(arc4random_uniform(UInt32(_numberIndex.count)))])
            }
        }
        if (charactersCount != 0) {
            for _ in 0...charactersCount-1 {
                pArray.append(_characterIndex[Int(arc4random_uniform(UInt32(_characterIndex.count)))])
            }
        }
        // Call randomMergeSort on all the arrays
        password = randomSwapSort(pArray).joined()
        return password
    }
    func randomSwapSort<T>(_ array: Array<T>) -> Array<T> {
        guard array.count > 1 else { return array }
        let middle = array.count / 2
        let ll = Array(array[0...middle - 1])
        let rr = Array(array[middle...array.count - 1])
        let left = randomSwapSort(ll)
        let right = randomSwapSort(rr)
        return randomSort(left, right)
    }
    func randomSort<T>(_ left: Array<T>, _ right: Array<T>) -> Array<T> {
        var leftCopy = left
        var rightCopy = right
        var leftCount = 0
        var rightCount = 0
        var output = Array<T>()
        while (leftCount < left.count && rightCount < right.count) {
            // left
            let lIndex = Int(arc4random_uniform(UInt32(leftCopy.count)))
            let rIndex = Int(arc4random_uniform(UInt32(rightCopy.count)))
            let ll = leftCopy[lIndex]
            let rr = rightCopy[rIndex]
            leftCopy.remove(at: lIndex)
            rightCopy.remove(at: rIndex)
            // right
            output.append(ll)
            output.append(rr)
            leftCount += 1
            rightCount += 1
        }
        return output;
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

