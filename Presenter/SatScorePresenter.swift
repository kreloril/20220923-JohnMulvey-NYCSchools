//
//  SatScorePresenter.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

protocol SatScorePresenterDelegate : NSObject {
    
    func satScoreOpenContactPage()
}

class SatScorePresenter: NSObject, UITableViewDelegate, UITableViewDataSource {

    weak var delegate:SatScorePresenterDelegate?
    var selectedSchool:SchoolViewModel?
    var selectedScore:SatScoreViewModel?
    
    init(with score:SatScoreViewModel, with school:SchoolViewModel) {
        super.init()
        
        selectedSchool = school
        selectedScore = score
    }
    
    var title:String {
        "SAT Scores"
    }
    /*
     
     Quick access to popover items
     
     */
    var popUpEmail:String {
        guard let school = selectedSchool else { return ""}
        
        return "Email : \(school.schoolEmail)"
    }
    
    var popUpPhone:String {
        guard let school = selectedSchool else { return ""}
        
        return "Phone : \(school.schoolPhone)"
    }

    var emailURL : URL? {
        guard let school = selectedSchool else { return nil}
        return  school.emailUrl
    }
    
    var phoneURL : URL? {
        guard let school = selectedSchool else { return nil}
        return school.phoneUrl
    }
}



extension SatScorePresenter {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let hasScores = selectedScore?.satScoreDataFound
        
        if indexPath.row == 1 && hasScores == true {
            return 138
        } else if indexPath.row == 3 {
            return 100
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row != 3 {
            return
        }
        
        if let delegate = self.delegate {
            delegate.satScoreOpenContactPage()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.phoneURL == nil && self.emailURL == nil {
            return 3
        }
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        guard let school = self.selectedSchool, let score = self.selectedScore else {
            return UITableViewCell()
        }
        
        switch (indexPath.row) {
            
        case 0: do {
            cell = tableView.dequeueReusableCell(withIdentifier: "titleCell")
            cell?.textLabel?.text = "\(score.school_name)\n\n\(school.address)"
            cell?.textLabel?.numberOfLines = 0;
            cell?.textLabel?.textAlignment = .center
            cell?.selectionStyle = .none
            cell?.textLabel?.textColor = UIColor.orange
            break;
        }
            
        case 1: do {
            
            if score.satScoreDataFound == false {
                cell = tableView.dequeueReusableCell(withIdentifier: "titleCell")
                cell?.selectionStyle = .none
                cell?.textLabel?.text = "No SAT scores present"
                cell?.textLabel?.numberOfLines = 0
                cell?.textLabel?.textColor = UIColor.red
                cell?.textLabel?.textAlignment = .center
                break
            }
            
            let scoreCell = tableView.dequeueReusableCell(withIdentifier: "satscoreInfo") as? NYCSATScoresTableViewCell
            scoreCell?.selectionStyle = .none
            scoreCell?.labelMathScore.text = score.scoreMath
            scoreCell?.labelReadingScore.text = score.scoreReading
            scoreCell?.labelWritingScore.text = score.scoreWriting
            
            cell = scoreCell
            break
        }
            
        case 2: do {
            cell = tableView.dequeueReusableCell(withIdentifier: "schoolDescCell")
            cell?.textLabel?.text = school.schoolDescription
            cell?.textLabel?.numberOfLines = 0;
            cell?.selectionStyle = .none
            break;
        }
        
        case 3: do {
            cell = tableView.dequeueReusableCell(withIdentifier: "titleCell")
            cell?.selectionStyle = .default
            cell?.backgroundColor = UIColor.blue
            cell?.layer.cornerRadius = 6.0
            cell?.textLabel?.text = "Contact School"
            cell?.textLabel?.textAlignment = .center
            cell?.textLabel?.textColor = UIColor.white
            cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            break;
        }
            
        default:
            break
        }
        
        if let cell = cell {
            return cell
        }
        
        return UITableViewCell()
    }
    
}
