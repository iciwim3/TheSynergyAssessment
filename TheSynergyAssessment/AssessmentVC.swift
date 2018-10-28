//
//  AssessmentVC.swift
//  TheSynergyAssessment
//
//  Created by Sain-R Edwards on 10/25/18.
//  Copyright © 2018 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit

class AssessmentVC: UIViewController, UITableViewDelegate, UITableViewDataSource, AssessmentProtocol {
    
    var model = AssessmentModel()
    var statements = [Assessment]()
    var statementIndex = 4
    var catalystIndex = 0
    var analystIndex = 0
    var stabilizerIndex = 0
    var harmonizerIndex = 0
    
    @IBOutlet weak var statementTableview: UITableView!
    @IBOutlet weak var dialogView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set self as delegate for model and call getStatements
        model.delegate = self
        model.getStatements()
        
        // Conform to table view protocols
        statementTableview.delegate = self
        statementTableview.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dialogView.layer.cornerRadius = 8
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // Tableview protocol methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard statements[statementIndex].statementNumber != nil else {
            return 0
        }
        
        return statements[statementIndex].statementNumber!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: STATEMENT_CELL, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // User has selected an answer
        
    }
    
    // MARK: - AssessmentProtocol methods
    
    func retrieveAssessment(statements: [Assessment]) {
        print("Yo, statements have returned!")
    }

}
