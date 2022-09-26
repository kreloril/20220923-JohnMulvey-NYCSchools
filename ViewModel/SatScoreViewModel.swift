//
//  SatScoreViewModel.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SatScoreViewModel: NSObject {

    let noDataFound:String = "No SAT data found"
    
    var dbn:String = ""
    var school_name:String = ""
    var numSatTakers:String = ""
    var scoreReading:String = ""
    var scoreMath:String = ""
    var scoreWriting:String = ""
    
    var satScoreDataFound:Bool = true
    
    init(with score:SatScore) {
        super.init()
        self.dbn = score.dbn
        self.school_name = score.school_name
        self.numSatTakers = score.num_of_sat_test_takers
        self.scoreReading = score.sat_critical_reading_avg_score
        self.scoreMath = score.sat_math_avg_score
        self.scoreWriting = score.sat_writing_avg_score
        satScoreDataFound = true
    }
    
     init(with schoolvm:SchoolViewModel) {
        super.init()
         satScoreDataFound = false
         self.dbn = schoolvm.dbn
         self.school_name = schoolvm.schoolName
         self.numSatTakers = noDataFound
         self.scoreReading = noDataFound
         self.scoreMath = noDataFound
         self.scoreWriting = noDataFound
    }
    

}
