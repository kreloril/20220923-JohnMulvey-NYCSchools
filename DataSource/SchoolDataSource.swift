//
//  SchoolDataSource.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SchoolDataSource {

    static let urlRemoteDataSource = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    
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
    
    static func importSchoolDataRemoteSource(finished:@escaping ((_ schools:[School]?) -> Void)) {
        
        NetworkManager.requestURL(url: SchoolDataSource.urlRemoteDataSource) { data, responseCode in
           
            if data != nil {
                if let responseData = data {
                    var result:[School]?
                    
                    do {
                            result = try JSONDecoder().decode([School].self, from: responseData)
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
