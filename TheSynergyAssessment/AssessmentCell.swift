//
//  AssessmentCell.swift
//  TheSynergyAssessment
//
//  Created by Sain-R Edwards on 10/28/18.
//  Copyright © 2018 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

class AssessmentCell: UITableViewCell {

    @IBOutlet weak var button1: RoundedButton!
    @IBOutlet weak var button2: RoundedButton!
    @IBOutlet weak var button3: RoundedButton!
    @IBOutlet weak var button4: RoundedButton!
    @IBOutlet weak var clearButton: RoundedButton!
    
    var score = 0
    var counter = 0
    
    var catalystScore = 0
    var analystScore = 0
    var stabilizerScore = 0
    var harmonizerScore = 0
    
    enum ButtonValues: Int {
        case one = 1, two, three, four
    }
    
    @IBAction func numberButtonPressed(_ sender: RoundedButton) {
        switch sender {
        case button1:
            counter += 1
            score = score + ButtonValues.one.rawValue
            disableButtons()
            print("Your score is \(score) and the counter is at \(counter).")
     
        case button2:
            counter += 1
            score = score + ButtonValues.two.rawValue
            disableButtons()
            print("Your score is \(score) and the counter is at \(counter).")
            
        case button3:
            counter += 1
            score = score + ButtonValues.three.rawValue
            disableButtons()
            print("Your score is \(score) and the counter is at \(counter).")
            
        case button4:
            counter += 1
            score = score + ButtonValues.four.rawValue
            disableButtons()
            print("Your score is \(score) and the counter is at \(counter).")
            
        default:
            return
        }
    }
    
    func addCounter() -> Int {
        let num = 1
        counter += num
        return counter
    }
    
    @IBAction func clearButtonTapped(_ sender: RoundedButton) {
        if counter >= 1 {
            reenableButtons()
            counter -= 1
        } else {
            return
        }
    }
    
    func reenableButtons() {
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        button4.isEnabled = true
    }
    
    func disableButtons() {
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
    }

}
