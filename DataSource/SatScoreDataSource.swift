//
//  SatScoreDataSource.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SatScoreDataSource: NSObject {
    
    static let urlRemoteDataSource = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
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
    }
    
    static func importSatScoreDataRemoteSource(finished:@escaping ((_ scores:[SatScore]?) -> Void)) {
        
        NetworkManager.requestURL(url: SatScoreDataSource.urlRemoteDataSource) { data, responseCode in
           
            if data != nil {
                if let responseData = data {
                    var result:[SatScore]?
                    
                    do {
                            result = try JSONDecoder().decode([SatScore].self, from: responseData)
                    } catch let error {
                        let errorDescription = error.localizedDescription
                        print("unable to parse source \(errorDescription)")
                        finished(nil);
                        return
                    }
                    
                    finished(result)
                    return
                }
                
            } else {
                finished(nil)
            }

        }
    }
    
    
    
}
