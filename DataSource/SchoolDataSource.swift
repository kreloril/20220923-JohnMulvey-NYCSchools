//
//  SchoolDataSource.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SchoolDataSource: NSObject {

    // Load data from container source
    // Convert into data
    // Use decoder to convert to codeable object
    // Convert into dictionary, with dbn as key.
    
    static func importSchoolDataSource(name:String) -> Dictionary<String,School> {
        
        var returnData = Dictionary<String,School>()
        
        let jsonDataSource = Bundle.main.path(forResource: name, ofType: "json")
        
        guard let jsonDataPath = jsonDataSource else {
            print("Unable to find source")
           return returnData;
        }
        
        let url = URL(fileURLWithPath: jsonDataPath)
        
    
        var result:[School]?
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode([School].self, from: jsonData)
            
            
        } catch let error {
            let errorDescription = error.localizedDescription
            print("unable to parse source \(errorDescription)")
            return returnData;
        }
        
        if let resultSchools = result {
        
            for data in resultSchools {
                returnData[data.dbn] = data
            }
            
        }
        
        return returnData
    }
    
}
