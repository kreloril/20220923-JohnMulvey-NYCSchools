//
//  SatScoreInterface.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SatScoreInterface {

    // convert model into viewmodel.
    static func valueObjectsFromModel(objects:[SatScore]) -> Dictionary<String,SatScoreViewModel> {
        
        var result = Dictionary<String,SatScoreViewModel>()
        // Create value objects, and put them into dictionary
        for scoreData in objects {
          let newScoreData = SatScoreViewModel(with: scoreData)
          result[newScoreData.dbn] = newScoreData
        }
        return result;
    }
    
}
