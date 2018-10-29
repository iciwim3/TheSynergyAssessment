//
//  AssessmentModel.swift
//  TheSynergyAssessment
//
//  Created by Sain-R Edwards on 10/27/18.
//  Copyright © 2018 Swift Koding 4 Everyone. All rights reserved.
//

import Foundation

protocol AssessmentProtocol {
    func retrieveAssessment(statements: [Assessment])
}

class AssessmentModel {
    
    var delegate: AssessmentProtocol?
    
    var assessCell = AssessmentCell()
    
    func getStatements() {
        
        // Go retrieve data
        getLocalJsonFile()
    }
    
    func getLocalJsonFile() {
        
        // Get a path to the json file in our app bundle
        let path = Bundle.main.path(forResource: "StatementData", ofType: ".json")
        
        guard path != nil else {
            print("Can't find the json file")
            return
        }
        
        // Create a URL object from that string path
        let url = URL(fileURLWithPath: path!)
        
        // Decode that data into instances of Assessment struct
        do {
            // Get the data from that URL
            let data = try Data(contentsOf: url)
            
            // Decode the json data
            let decoder = JSONDecoder()
            let array = try decoder.decode([Assessment].self, from: data)
            
            // Return the statement structs to the view controller
            delegate?.retrieveAssessment(statements: array)
            
        }
        catch {
            print("Couldn't create data object from file.")
        }
        
    }
    
    func getRemoteJsonFile() {
        
    }
    
}
