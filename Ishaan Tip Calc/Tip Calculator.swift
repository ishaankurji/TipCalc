//
//  Tip Calculator.swift
//  Ishaan Tip Calc
//
//  Created by Ishaan Kurji on 2/4/19.
//  Copyright © 2019 Ishaan Kurji. All rights reserved.
//

import Foundation

class TipCalculator {
    var amtBeforeTax: Double = 0
    var tipamt: Double = 0
    var tipPct: Double = 0
    var totalamt: Double = 0
    
    init(amountBeforeTax: Double, tipPercentage: Double) {
        self.amtBeforeTax = amountBeforeTax
        self.tipPct = tipPercentage
    }
    
    func calculateTip() {
        tipamt = amtBeforeTax * tipPct
        totalamt = tipamt + amtBeforeTax
    }
}
