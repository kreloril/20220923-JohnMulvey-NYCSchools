//
//  SchoolInterface.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SchoolInterface {

    // Converts the model into the viewmodel; text ready for cell
    static func valueObjectsFromModel(objects:[School]) -> [SchoolViewModel] {
            
        var returnValue:[SchoolViewModel] = [SchoolViewModel]()
        
        // Create the value objects
        for schoolData in objects {
            let newSchool = SchoolViewModel(with:schoolData)
            returnValue.append(newSchool)
        }
  
        return returnValue
    }
    
}
