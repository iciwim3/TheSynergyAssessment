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
    var statementIndex = 0
    var catalystIndex = 0
    var analystIndex = 0
    var stabilizerIndex = 0
    var harmonizerIndex = 0
    
    var assessmentCell = AssessmentCell()
    
    @IBOutlet weak var statementTableview: UITableView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var nextButton: RoundedButton!
    @IBOutlet weak var assessmentStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide the assessment stack view
        assessmentStackView.isHidden = true
        
        // Hide the assessment's next button
        nextButton.isHidden = true
        
        // Set self as delegate for model and call getStatements
        model.delegate = self
        model.getStatements()
        
        // Conform to table view protocols
        statementTableview.delegate = self
        statementTableview.dataSource = self
    }
    
    func displayStatements() {
        
        // Check that current statement index is not beyond the bounds of the statement array
        guard statementIndex < statements.count else {
            print("Trying to display a statement index that is out of bounds.")
            return
        }
        
        // Display the statements
        statementTableview.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dialogView.layer.cornerRadius = 8
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // Tableview protocol methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard statements.count > 0 && statements[statementIndex].statements != nil else {
            return 0
        }
        
        return statements[statementIndex].statements!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: STATEMENT_CELL, for: indexPath)
        
        // Get the label
        let label = cell.viewWithTag(1) as! UILabel
        
        // Set the text for the label
        label.text = statements[statementIndex].statements![indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // User has selected an answer
        
    }
    
    // MARK: - AssessmentProtocol methods
    
    func retrieveAssessment(statements: [Assessment]) {
        
        // set our questions property with the questions from quiz model
        self.statements = statements
        
        // Display the first few statements
        displayStatements()
    }

    @IBAction func dialogOkButtonTapped(_ sender: UIButton) {
        // Dismiss the dialog view
        dialogView.isHidden = true
        
        // Show the Assessment view
        assessmentStackView.isHidden = false
        
        // Show the Next button
        nextButton.isHidden = false
    }
}
