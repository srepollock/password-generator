//
//  FirstViewController.swift
//  Generate App
//
//  Created by Spencer Pollock on 2018-07-12.
//  Copyright © 2018 spollock. All rights reserved.
//

import UIKit

class ManuViewController: UIViewController {
    @IBOutlet weak var lengthSlider: UISlider!
    @IBOutlet weak var lengthValueText: UITextField!
    @IBOutlet weak var capitalsSlider: UISlider!
    @IBOutlet weak var capitalsValueText: UITextField!
    @IBOutlet weak var numbersSlider: UISlider!
    @IBOutlet weak var numbersValueText: UITextField!
    @IBOutlet weak var charactersSlider: UISlider!
    @IBOutlet weak var charactersValueText: UITextField!
    @IBOutlet weak var passwordStrength: UIProgressView!
    @IBOutlet weak var tooManyValuesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lengthValueChanged(lengthSlider)
        capitalsValueChanged(capitalsSlider)
        numbersValueChanged(numbersSlider)
        charactersValueChanged(charactersSlider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lengthValueChanged(_ sender: UISlider) {
        sender.setValue(Float(lroundf(lengthSlider.value)), animated: true)
        lengthValueText.text = Int(lengthSlider.value).description
        checkPassword()
    }
    
    @IBAction func capitalsValueChanged(_ sender: UISlider) {
        sender.setValue(Float(lroundf(capitalsSlider.value)), animated: true)
        capitalsValueText.text = Int(capitalsSlider.value).description
        checkPassword()
    }
    
    @IBAction func numbersValueChanged(_ sender: UISlider) {
        sender.setValue(Float(lroundf(numbersSlider.value)), animated: true)
        numbersValueText.text = Int(numbersSlider.value).description
        checkPassword()
    }
    
    @IBAction func charactersValueChanged(_ sender: UISlider) {
        sender.setValue(Float(lroundf(charactersSlider.value)), animated: true)
        charactersValueText.text = Int(charactersSlider.value).description
        checkPassword()
    }
    
    // Passing information over segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passwordViewController = segue.destination as? PasswordViewController {
            passwordViewController.passwordLength = UInt32(lengthSlider.value)
            passwordViewController.capitalsCount = UInt32(capitalsSlider.value)
            passwordViewController.numbersCount = UInt32(numbersSlider.value)
            passwordViewController.charactersCount = UInt32(charactersSlider.value)
        }
    }
    @IBAction func generatePassword(_ sender: UIButton) {
        if (tooManyValuesLabel.isHidden) {
            performSegue(withIdentifier: "generatePasswordSegue", sender: self)
        }
    }
    func checkPassword() {
        var strength: Int = 0
        let additional = capitalsSlider.value + numbersSlider.value + charactersSlider.value
        if (additional > lengthSlider.value) {
            tooManyValuesLabel.isHidden = false
        } else {
            tooManyValuesLabel.isHidden = true
        }
        strength = Int(lengthSlider.value / 5) + Int(capitalsSlider.value / 2) + Int(numbersSlider.value) + Int(charactersSlider.value)
        switch (strength) {
        case 1:
            passwordStrength.progressTintColor = UIColor.red
            passwordStrength.setProgress(0.1, animated: true)
        case 2:
            passwordStrength.progressTintColor = UIColor.red
            passwordStrength.setProgress(0.2, animated: true)
        case 3:
            passwordStrength.progressTintColor = UIColor.red
            passwordStrength.setProgress(0.3, animated: true)
        case 4:
            passwordStrength.progressTintColor = UIColor.orange
            passwordStrength.setProgress(0.4, animated: true)
        case 5:
            passwordStrength.progressTintColor = UIColor.orange
            passwordStrength.setProgress(0.5, animated: true)
        case 6:
            passwordStrength.progressTintColor = UIColor.orange
            passwordStrength.setProgress(0.6, animated: true)
        case 7:
            passwordStrength.progressTintColor = UIColor.green
            passwordStrength.setProgress(0.7, animated: true)
        case 8:
            passwordStrength.progressTintColor = UIColor.green
            passwordStrength.setProgress(0.8, animated: true)
        case 9:
            passwordStrength.progressTintColor = UIColor.green
            passwordStrength.setProgress(0.9, animated: true)
        case 10:
            passwordStrength.progressTintColor = UIColor.green
            passwordStrength.setProgress(1, animated: true)
        default:
            break
        }
    }
}

