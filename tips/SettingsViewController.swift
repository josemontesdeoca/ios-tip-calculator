//
//  SettingsViewController.swift
//  tips
//
//  Created by Jose Montes de Oca on 9/7/15.
//  Copyright (c) 2015 JoseOnline. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Read the default tip from NSUserDefaults storage
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipIndex = defaults.integerForKey("default_tip_index")

        tipControl.selectedSegmentIndex = defaultTipIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onValueChanged(sender: AnyObject) {
        var tipIndexSelected = tipControl.selectedSegmentIndex

        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipIndexSelected, forKey: "default_tip_index")
        defaults.synchronize()
    }

    @IBAction func onTouchUp(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
