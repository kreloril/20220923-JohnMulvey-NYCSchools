//
//  SatScoreDataSource.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SatScoreDataSource: NSObject {
    
    // Load data from container source
    // Convert into data
    // Use decoder to convert to codeable object
    // Convert into dictionary, with dbn as key.
    
    static func importSatScoreDataSource(name:String) -> Dictionary<String,SatScore> {
        
        var returnData = Dictionary<String,SatScore>()
        
        let jsonDataSource = Bundle.main.path(forResource: name, ofType: "json")
        
        guard let jsonDataPath = jsonDataSource else {
            print("Unable to find source")
           return returnData;
        }
        
        let url = URL(fileURLWithPath: jsonDataPath)
        
    
        var result:[SatScore]?
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode([SatScore].self, from: jsonData)
            
            
        } catch let error {
            let errorDescription = error.localizedDescription
            print("unable to parse source \(errorDescription)")
            return returnData;
        }
        
        if let resultScores = result {
        
            for data in resultScores {
                returnData[data.dbn] = data
            }
            
        }
        
        return returnData
    }}
