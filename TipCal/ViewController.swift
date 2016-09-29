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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmt.becomeFirstResponder()
        billAmtHt.constant = self.view.frame.size.height/2
        
        self.calculatePricing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func billChanged(sender: AnyObject) {
        var ht : CGFloat = 100
        if(billAmt.text!.isEmpty){
            ht = self.view.frame.size.height/2
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
        
        
        tip.text = String(format: "$%.2f", tipVal)
        total1.text = String(format: "$%.2f", totalVal)
        total2.text = String(format: "$%.2f", totalVal/2)
        total3.text = String(format: "$%.2f", totalVal/3)
        total4.text = String(format: "$%.2f", totalVal/4)
        
    }

    @IBAction func onTipPerChange(sender: AnyObject) {
        billAmt.resignFirstResponder()
        self.calculatePricing()
    }
    
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        billAmt.resignFirstResponder()
    }
}

