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
    }
    
    @IBAction func capitalsValueChanged(_ sender: UISlider) {
        sender.setValue(Float(lroundf(capitalsSlider.value)), animated: true)
        capitalsValueText.text = Int(capitalsSlider.value).description
    }
    
    @IBAction func numbersValueChanged(_ sender: UISlider) {
        sender.setValue(Float(lroundf(numbersSlider.value)), animated: true)
        numbersValueText.text = Int(numbersSlider.value).description
    }
    
    @IBAction func charactersValueChanged(_ sender: UISlider) {
        sender.setValue(Float(lroundf(charactersSlider.value)), animated: true)
        charactersValueText.text = Int(charactersSlider.value).description
    }
    
    // Passing information over segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passwordViewController = segue.destination as? PasswordViewController {
            passwordViewController.length = UInt32(lengthSlider.value)
            passwordViewController.capitals = UInt32(lengthSlider.value)
            passwordViewController.numbers = UInt32(lengthSlider.value)
            passwordViewController.characters = UInt32(lengthSlider.value)
        }
    }
    @IBAction func generatePassword(_ sender: UIButton) {
        performSegue(withIdentifier: "generatePasswordSegue", sender: self)
    }
}

