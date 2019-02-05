//
//  TipCalcViewController.swift
//  Ishaan Tip Calc
//
//  Created by Ishaan Kurji on 2/4/19.
//  Copyright © 2019 Ishaan Kurji. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController
{
    
    @IBOutlet weak var amtBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPctLabel: UILabel!
    @IBOutlet weak var tipPctSlider: UISlider!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    @IBOutlet weak var totalResultLabel: UILabel!
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amtBeforeTaxTextField.becomeFirstResponder()
    }
    
    func calculateBill() {
        tipCalculator.tipPct = Double(tipPctSlider.value) / 100.0
        tipCalculator.amtBeforeTax = (amtBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        totalResultLabel.text = String(format: "$%0.2f", tipCalculator.totalamt)
        let numberOfPeople: Int = Int(numberOfPeopleSlider.value)
        eachPersonAmountLabel.text = String(format: "$%0.2f", tipCalculator.totalamt / Double(numberOfPeople))
    }
    
    
    // MARK: - Target / Action
    
    @IBAction func tipSliderValueChanged(sender: Any) {
        tipPctLabel.text = String(format: "Tip: %02d%%", Int(tipPctSlider.value))
        calculateBill()
    }
    
    @IBAction func numberOfPeopleSliderValueChanged(sender: Any) {
        numberOfPeopleLabel.text = "Slit: \(Int(numberOfPeopleSlider.value))"
        calculateBill()
    }
    @IBAction func amountBeforeTaxTextFieldChanged(_ sender: Any) {
        calculateBill()
    }
    
}
