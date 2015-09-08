//
//  ViewController.swift
//  tips
//
//  Created by Jose Montes de Oca on 9/7/15.
//  Copyright (c) 2015 JoseOnline. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"

        // Read the default tip from NSUserDefaults storage
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipIndex = defaults.integerForKey("default_tip_index")

        tipControl.selectedSegmentIndex = defaultTipIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTipCalculation(tipControl.selectedSegmentIndex)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func unwindToSegue (segue : UIStoryboardSegue) {
        // Read the default tip from NSUserDefaults storage that has changed
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipIndex = defaults.integerForKey("default_tip_index")

        tipControl.selectedSegmentIndex = defaultTipIndex
        updateTipCalculation(defaultTipIndex)
    }

    func updateTipCalculation(tipIndexSelected : Int) {
        var tipPercentages = [0.18, 0.2, 0.25]
        var tipSelected = tipPercentages[tipIndexSelected]

        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipSelected
        var total = billAmount + tip

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

