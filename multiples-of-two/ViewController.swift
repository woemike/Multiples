//
//  ViewController.swift
//  multiples-of-two
//
//  Created by Mark Price on 7/30/15.
//  Copyright © 2015 devslopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var whatMultipleTxt: UITextField!
    @IBOutlet weak var sumLbl: UILabel!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    //Properties
    var multiple = 0
    var runningSum = 0
    let MAX_SUM = 50
 

    @IBAction func onAddBtnTapped(sender: AnyObject) {
        //Since we never change the newSum value make it a constant
        let newSum = runningSum + multiple
        updateLbl(runningSum, mul: multiple, newSum: newSum)
        runningSum += multiple
        
        if isGameOver() {
            restartGame()
        }
    }
    
    @IBAction func onPlayBtnTapped(sender: AnyObject) {
        
        if whatMultipleTxt.text != nil && whatMultipleTxt.text != "" {
            
            whatMultipleTxt.hidden = true
            logoImg.hidden = true
            playBtn.hidden = true
            sumLbl.hidden = false
            addBtn.hidden = false
            
            resetLbl()
            multiple = Int(whatMultipleTxt.text!)!
            runningSum = 0
        }
    }
    
    func restartGame() {
        multiple = 0
        whatMultipleTxt.text = ""
        whatMultipleTxt.hidden = false
        logoImg.hidden = false
        playBtn.hidden = false
        sumLbl.hidden = true
        addBtn.hidden = true
        resetLbl()
    }
    
    func resetLbl() {
        sumLbl.text = "Press Add to add!"
    }
    
    func isGameOver() -> Bool {
        if runningSum >= MAX_SUM {
            return true
        } else {
            return false
        }
    }
    
    func updateLbl(oldSum: Int, mul: Int, newSum: Int) {
        sumLbl.text = "\(oldSum) + \(mul) = \(newSum)"
    }
    
    // Dismiss keyboard section
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

}

