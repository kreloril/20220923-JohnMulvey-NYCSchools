//
//  FileManager.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/24/22.
//

import UIKit

class FileManager {

    static func dataForPath(name:String,ext:String) -> Data? {

        let dataSource = Bundle.main.path(forResource: name, ofType: ext)
        
        guard let dataPath = dataSource else {
            print("Unable to find source")
           return nil
        }
        
        let url = URL(fileURLWithPath: dataPath)
        var data:Data?
        do {
            data = try Data(contentsOf: url)
        } catch let error {
            let errorDescription = error.localizedDescription
            print("Filemanager.dataForPath: \(errorDescription)")
            return nil;
        }
        return data;
    }
    
}
