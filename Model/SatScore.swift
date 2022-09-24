//
//  SatScores.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

struct SatScore : Codable {

    let dbn:String
    let school_name:String
    let num_of_sat_test_takers:String
    let sat_critical_reading_avg_score:String
    let sat_math_avg_score:String
    let sat_writing_avg_score:String
    
}
