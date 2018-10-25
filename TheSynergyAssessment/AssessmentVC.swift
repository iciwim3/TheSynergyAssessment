//
//  AssessmentVC.swift
//  TheSynergyAssessment
//
//  Created by Sain-R Edwards on 10/25/18.
//  Copyright © 2018 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

class AssessmentVC: UIViewController {
    
    @IBOutlet weak var dialogView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dialogView.layer.cornerRadius = 8
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

}
