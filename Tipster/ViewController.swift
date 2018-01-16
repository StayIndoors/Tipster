//
//  ViewController.swift
//  Tipster
//
//  Created by Matthew on 1/15/18.
//  Copyright © 2018 Matthew Burnside. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    MARK: Properties
    @IBOutlet var billLabel: UILabel!
    var billAmount = "0"
    
    @IBOutlet var lowPercentageLabel: UILabel!
    @IBOutlet var midPercentageLabel: UILabel!
    @IBOutlet var highPercentageLabel: UILabel!
    
    @IBOutlet var lowTipLabel: UILabel!
    @IBOutlet var midTipLabel: UILabel!
    @IBOutlet var highTipLabel: UILabel!
    
    @IBOutlet var lowTotalLabel: UILabel!
    @IBOutlet var midTotalLabel: UILabel!
    @IBOutlet var highTotalLabel: UILabel!
    
    
    @IBOutlet var groupSizeLabel: UILabel!
    var groupMemberNumber = 1
    var taxRate = 0.10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupSizeLabel.text = "Group Size: \(groupMemberNumber)"
        calculate()
    }

    //    MARK: Actions
    @IBAction func tipSlider(_ sender: UISlider) {
        taxRate = Double(sender.value)
        calculate()
    }
    
    @IBAction func groupSizeSlider(_ sender: UISlider) {
        groupMemberNumber = Int(round(sender.value))
        groupSizeLabel.text = "Group Size: \(groupMemberNumber)"
        calculate()
    }
    
    @IBAction func billAmountInput(_ sender: UIButton) {
        if sender.currentTitle == "c" {
            billAmount = "0"
            billLabel.text = billAmount
            calculate()
            return
        }
        if billLabel.text == "0" {
            billAmount = sender.currentTitle!
            billLabel.text = billAmount
            calculate()
        }
        else {
            billAmount.append(sender.currentTitle!)
            billLabel.text = billAmount
            calculate()
        }
    }
    func calculate() {
        lowPercentageLabel.text = String(Int(round(taxRate * 100))) + "%"
        midPercentageLabel.text = String(Int(round(taxRate * 100 + 5))) + "%"
        highPercentageLabel.text = String(Int(round(taxRate * 100 + 10))) + "%"
        
        lowTipLabel.text = String(format: "%.02f", (Double(billAmount)! * (Double(taxRate)))/Double(groupMemberNumber))
        midTipLabel.text = String(format: "%.02f", (Double(billAmount)! * (Double(taxRate + 0.05)))/Double(groupMemberNumber))
        highTipLabel.text = String(format: "%.02f", (Double(billAmount)! * (Double(taxRate + 0.10)))/Double(groupMemberNumber))
        
        lowTotalLabel.text = String(format: "%.02f", ((Double(billAmount)! * (Double(taxRate) + 1)))/Double(groupMemberNumber))
        midTotalLabel.text = String(format: "%.02f", (Double(billAmount)! * (Double(taxRate + 0.05) + 1))/Double(groupMemberNumber))
        highTotalLabel.text = String(format: "%.02f", (Double(billAmount)! * (Double(taxRate + 0.10) + 1))/Double(groupMemberNumber))
    }
}
