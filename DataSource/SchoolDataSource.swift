//
//  SchoolDataSource.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SchoolDataSource {

    // Load data from container source
    // Convert into data
    // Use decoder to convert to codeable object
    
    static func importSchoolDataSource(name:String) -> [School]? {
        
        var result:[School]?
        
        do {
            let jsonData = FileManager.dataForPath(name: name, ext: "json")
            
            if let jsonData = jsonData {
                result = try JSONDecoder().decode([School].self, from: jsonData)
            }
            
        } catch let error {
            let errorDescription = error.localizedDescription
            print("unable to parse source \(errorDescription)")
            return result;
        }
       
        return result
    }
    
}
