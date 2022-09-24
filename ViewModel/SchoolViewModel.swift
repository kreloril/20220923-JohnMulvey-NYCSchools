//
//  SchoolViewModel.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SchoolViewModel: NSObject {

    var schoolName:String = ""
    var dbn:String = ""
    var address:String = ""
    var schoolDescription:String = ""
    var location:String = ""
    var phonenumer:String = ""
    var schoolEmail:String = ""
    var website:String = ""
    
    
    init(with school:School) {
        super.init()
        self.schoolName = school.school_name
        self.dbn = school.dbn;
        
        if let addr = school.primary_address_line_1, let city = school.city, let zip = school.zip, let statecode = school.state_code {
            self.address = "\(addr) \(city), \(statecode) \(zip)"
        }
        
        if let desc = school.overview_paragraph {
            self.schoolDescription = desc
        }
        
        if let loc = school.location {
            self.location = loc
        }
        
        if let pn = school.phone_number {
            self.phonenumer = pn
        }
        
        if let email = school.school_email {
            self.schoolEmail = email
        }
        
        if let ws = school.website {
            self.website = ws
        }
    }
}
