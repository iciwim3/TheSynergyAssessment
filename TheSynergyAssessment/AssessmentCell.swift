//
//  AssessmentCell.swift
//  TheSynergyAssessment
//
//  Created by Sain-R Edwards on 10/28/18.
//  Copyright © 2018 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

protocol UpdateCounter {
    func incrementCounter()
    func decrementCounter()
}

class AssessmentCell: UITableViewCell {

    @IBOutlet weak var button1: RoundedButton!
    @IBOutlet weak var button2: RoundedButton!
    @IBOutlet weak var button3: RoundedButton!
    @IBOutlet weak var button4: RoundedButton!
    @IBOutlet weak var clearButton: RoundedButton!
    
    var score = 0
    var counter = 0
    
    var delegate: UpdateCounter?
    
    var catalystScore = 0
    var analystScore = 0
    var stabilizerScore = 0
    var harmonizerScore = 0
    
    enum ButtonValues: Int {
        case one = 1, two, three, four
    }
    
    @IBAction func numberButtonPressed(_ sender: RoundedButton) {
        delegate?.incrementCounter()
        disableButtons()
    }
    
    @IBAction func clearButtonTapped(_ sender: RoundedButton) {
        delegate?.decrementCounter()
        reenableButtons()
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
