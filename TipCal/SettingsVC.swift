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
    @IBOutlet weak var howToTipBtn: UIButton!
    
    var themeColor = [UIColor.blueColor(), UIColor.redColor(), UIColor.greenColor()]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        tipOptionsSwitch.on = defaults.boolForKey("DISPLAY_4_OPTIONS")
        self.tipOptionsChanged(tipOptionsSwitch)
        
        themeOptions.selectedSegmentIndex = defaults.integerForKey("THEME_OPTIONS_INDEX")
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
        self.howToTipBtn.tintColor = selThemeColor
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(themeOptions.selectedSegmentIndex, forKey:"THEME_OPTIONS_INDEX")
    }
    
    
    @IBAction func howToTip(sender: AnyObject) {
        let url = NSURL(string: "http://www.cntraveler.com/stories/2008-11-11/etiquette-101-tipping-guide")!
        UIApplication.sharedApplication().openURL(url)
    }
}
