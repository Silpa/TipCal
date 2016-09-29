//
//  ViewController.swift
//  TipCal
//
//  Created by Ankem, Silpa on 9/28/16.
//  Copyright © 2016 Ankem, Silpa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate{

    
    @IBOutlet weak var billAmt: UITextField!
    
    @IBOutlet weak var tip: UILabel!
    
    @IBOutlet weak var total1: UILabel!
    @IBOutlet weak var total2: UILabel!
    @IBOutlet weak var total3: UILabel!
    @IBOutlet weak var total4: UILabel!
    
    
    @IBOutlet weak var tipPerBtn: UISegmentedControl!
    
    
    @IBOutlet weak var billAmtHt: NSLayoutConstraint!
    
    var tipPerArr = [10.0, 15.0, 18.0, 20.0]
    
    var themeColor = [UIColor.blueColor(), UIColor.redColor(), UIColor.greenColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem?.title = NSString(string: "\u{2699}") as String
        if let font = UIFont(name: "Helvetica", size: 18.0) {
            self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let index : Int = defaults.integerForKey("THEME_OPTIONS_INDEX")
        tipPerBtn.tintColor = index == 0 ? self.view.tintColor : themeColor[index]
        
        billAmt.becomeFirstResponder()
        billAmt.placeholder = NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as? String ?? "$"
        
        billAmtHt.constant = (self.view.frame.size.height - self.navigationController!.navigationBar.frame.size.height)/2
        
        self.calculatePricing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func billChanged(sender: AnyObject) {
        var ht : CGFloat = 100
        if(billAmt.text!.isEmpty){
//            ht = self.view.frame.size.height/2
            ht = (self.view.frame.size.height - self.navigationController!.navigationBar.frame.size.height)/2
        }

        UIView.animateWithDuration(0.5) {
            self.billAmtHt.constant = ht;
            self.view.layoutIfNeeded()
        }
        
        self.calculatePricing()
    }
    
    func calculatePricing() {
        
        let billAmtVal = Double(billAmt.text!) ?? 0
        let tipSel = tipPerArr[tipPerBtn.selectedSegmentIndex]
        let tipVal = billAmtVal/tipSel
        let totalVal = billAmtVal + tipVal
        
        let formatter = NSNumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale.currentLocale() // This is the default
        
        tip.text = formatter.stringFromNumber(tipVal) //String(format: "$%.2f", tipVal)
        total1.text = formatter.stringFromNumber(totalVal)
        total2.text = formatter.stringFromNumber(totalVal/2)
        total3.text = formatter.stringFromNumber(totalVal/3)
        total4.text = formatter.stringFromNumber(totalVal/4)
        
    }

    @IBAction func onTipPerChange(sender: AnyObject) {
        billAmt.resignFirstResponder()
        self.calculatePricing()
    }
    
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        billAmt.resignFirstResponder()
    }
}

