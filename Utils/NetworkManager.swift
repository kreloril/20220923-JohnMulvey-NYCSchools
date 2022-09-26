//
//  NetworkManager.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/24/22.
//

import UIKit

class NetworkManager {

    static func requestURL(url:String, finished: @escaping ((_ data:Data?,_ responseCode:Int) -> Void)) {
    
        // make sure our url request is valid
        guard let urlRequest = URL(string: url) else
        {
            finished(nil,0)
            return
        }
        
        let request = URLRequest(url: urlRequest)
        let session = URLSession.shared
        let urlTask = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            if let urlresponse = response as? HTTPURLResponse  {
                finished(data,urlresponse.statusCode)
            } else {
                finished(data,0)
            }
        })
        
        urlTask.resume()
        
    }
}
