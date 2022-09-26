//
//  NYCConstants.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/26/22.
//

import UIKit

struct NYCSchoolViewControllerConstants {
    static let dataSourceLocalSchools:String = "f9bf-2cp4-schools"
    static let dataSourceLocalScores:String = "f9bf-2cp4-sat"
    static let refreshButtonImageName:String = "refresh"
}

struct SchoolPresenterConstants {
    static let presenterTitleName = "NYC School"
    
    static let defaultRowHeight = 125.0
    static let defaultHeaderHeight = 0.0
    static let presenterSchoolCellName = "cellSchool"
}

struct ScorePresenterConstants {
    static let defaultRow1Height = 138.0
    static let defaultRow3Height = 100.0
    static let cellNameTitle = "titleCell"
    static let satScoresNotPresent = "No SAT scores present"
    static let satScoreInfoCell = "satscoreInfo"
    static let schoolDescCell = "schoolDescCell"
    
    static let buttonContactSchoolName = "Contact School"
}

struct NYCSatScoreViewControllerConstants {
    static let errorDialogAlert = "Error!"
    static let errorEmulatorText = "Unable to launch url on emulator"
    static let buttonOKText = "Ok"
    static let buttonCancelText = "Cancel"
    static let popOverTextContactMethod = "Contact Method"
}
