//
//  SettingsVC.swift
//  TipCal
//
//  Created by Ankem, Silpa on 9/29/16.
//  Copyright © 2016 Ankem, Silpa. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    
    @IBOutlet weak var tipOptionsSwitch: UISwitch!
    
    @IBOutlet weak var themeOptions: UISegmentedControl!
    
    var themeColor = [UIColor.blueColor(), UIColor.redColor(), UIColor.greenColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()

        themeOptions.selectedSegmentIndex = defaults.objectForKey("THEME_OPTIONS_INDEX") != nil ? defaults.integerForKey("THEME_OPTIONS_INDEX") : 0
        self.themeOptionsChanged(themeOptions)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipOptionsChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(tipOptionsSwitch.on, forKey: "DISPLAY_4_OPTIONS");
    }
    
    
    
    @IBAction func themeOptionsChanged(sender: AnyObject) {
        let selThemeColor = themeOptions.selectedSegmentIndex == 0 ? self.view.tintColor : themeColor[themeOptions.selectedSegmentIndex]
        
        self.tipOptionsSwitch.tintColor = selThemeColor
        self.tipOptionsSwitch.onTintColor = selThemeColor
        self.themeOptions.tintColor = selThemeColor
        self.navigationController?.navigationBar.tintColor = selThemeColor
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(themeOptions.selectedSegmentIndex, forKey:"THEME_OPTIONS_INDEX")
    }
}
