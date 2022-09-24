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
    
    static func importSatScoreDataSource(name:String) -> [SatScore]? {
    
        var result:[SatScore]?
    
        do {
            // Load file from local path
            let jsonData = FileManager.dataForPath(name: name, ext: "json")
            // Attempt to decode json
            if let jsonData = jsonData {
                result = try JSONDecoder().decode([SatScore].self, from: jsonData)
            }
          // Handle errors
        } catch let error {
            let errorDescription = error.localizedDescription
            print("unable to parse source \(errorDescription)")
            return nil;
        }
        
        return result
    }}
