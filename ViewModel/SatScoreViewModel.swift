//
//  SatScoreViewModel.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SatScoreViewModel: NSObject {

    var dbn:String = ""
    var school_name:String = ""
    var numSatTakers:String = ""
    var scoreReading:String = ""
    var scoreMath:String = ""
    var scoreWriting:String = ""
    
    init(with score:SatScore) {
        super.init()
        self.dbn = score.dbn
        self.school_name = score.school_name
        self.numSatTakers = score.num_of_sat_test_takers
        self.scoreReading = score.sat_critical_reading_avg_score
        self.scoreMath = score.sat_math_avg_score
        self.scoreWriting = score.sat_writing_avg_score
    }
}
