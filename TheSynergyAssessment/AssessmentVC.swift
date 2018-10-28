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
    var catalystIndex = 0
    var analystIndex = 0
    var stabilizerIndex = 0
    var harmonizerIndex = 0
    
    @IBOutlet weak var statementTableview: UITableView!
    @IBOutlet weak var dialogView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        model.getStatements()

        statementTableview.delegate = self
        statementTableview.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dialogView.layer.cornerRadius = 8
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: STATEMENT_CELL, for: indexPath) as! StatementCell
        return cell
    }
    
    // MARK: - AssessmentProtocol methods
    
    func retrieveAssessment(statements: [Assessment]) {
        print("Yo, statements have returned!")
    }

}
