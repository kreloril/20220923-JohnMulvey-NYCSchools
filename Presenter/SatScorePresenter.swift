//
//  SatScorePresenter.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class SatScorePresenter: NSObject {

    var selectedSchool:SchoolViewModel?
    var selectedScore:SatScoreViewModel?
    
    init(with score:SatScoreViewModel, with school:SchoolViewModel) {
        super.init()
        
        selectedSchool = school
        selectedScore = score
    }
}
