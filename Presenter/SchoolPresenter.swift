//
//  SchoolPresenter.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit
/*
 
 Presenter, responsable for handling view content
 
 */

protocol SchoolPresenterDelegate : NSObject {
    
    func schoolSelected(with school:SchoolViewModel, with scores:SatScoreViewModel)
    
}

class SchoolPresenter: NSObject, UITableViewDelegate, UITableViewDataSource {

    weak var delegate:SchoolPresenterDelegate?
    
    var viewModelScores:Dictionary<String,SatScoreViewModel>?
    var viewModelSchools:[SchoolViewModel]?

    init(dataSourceSchools:String, dataSourceScores:String) {
        
        let sourceSchools = SchoolDataSource.importSchoolDataSource(name: dataSourceSchools)
        
        
        let sourceScores = SatScoreDataSource.importSatScoreDataSource(name: dataSourceScores)
   
        
        if let source = sourceSchools {
            viewModelSchools = SchoolInterface.valueObjectsFromModel(objects: source)
        }
        
        if let source = sourceScores {
            viewModelScores = SatScoreInterface.valueObjectsFromModel(objects: source)
        }
    }
    
    init(schools:[School], scores:[SatScore]) {
        super.init()
       
        viewModelSchools = SchoolInterface.valueObjectsFromModel(objects: schools)
        viewModelScores = SatScoreInterface.valueObjectsFromModel(objects: scores)
        
    }
    
    var title: String {
        return SchoolPresenterConstants.presenterTitleName
    }
}

extension SchoolPresenter {
    
    // Find the school we need
    
    func schoolForIndex(index:Int) -> SchoolViewModel? {
        
        guard let objects = self.viewModelSchools else {
            return nil
        }
        
        if index < 0 || index > objects.count {
            return nil
        }
        
        return objects[index]
    }
    
    // use the dbn, to find the score we need
    
    func satScoreForSchool(dbn:String) -> SatScoreViewModel? {
        
        if dbn.isEmpty {
            return nil
        }
        
        guard let objects = self.viewModelScores else {
            return nil
        }
       
        return objects[dbn]
    }
    // quick find the dbn we are looking for
    func dbnForSchoolIndex(index:Int, schoolIn: inout SchoolViewModel?) -> String {
        var returnString:String  = ""
        
        let school = schoolForIndex(index: index)
        
        if let school = school {
            returnString = school.dbn
            schoolIn = school
        }
        
        return returnString
    }
    
    func schoolSelectionDelegate(school:SchoolViewModel,score:SatScoreViewModel) {
        
        if let del = self.delegate {
            del.schoolSelected(with: school, with: score)
        }
    }
    
}


/*
 
 Tableview Delegates
 normal delegates used for tableview styling
 */

extension SchoolPresenter  {

    func tableView(_ tableView: UITableView, heightForHeaderInSection:Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //
    //  find the dbn, look up scores, then call delegate
    //
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        var school:SchoolViewModel?
        let dbn = dbnForSchoolIndex(index: indexPath.section,schoolIn: &school)
        
        if dbn.isEmpty {
            return
        }

        var satScores:SatScoreViewModel? = satScoreForSchool(dbn: dbn)
        

        if let school = school  {
            // Protect against scores not found in db
            if satScores == nil {
                satScores = SatScoreViewModel(with: school)
            }
            
            guard let satScores = satScores else {
                return
            }

            schoolSelectionDelegate(school: school, score: satScores)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let objects = viewModelSchools {
            return objects.count
        }
        
        return 0;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SchoolPresenterConstants.defaultHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SchoolPresenterConstants.defaultRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SchoolPresenterConstants.presenterSchoolCellName, for: indexPath) as? NYCSchoolTableViewCell
        
        if let objects = self.viewModelSchools, let cell = cell {
   
            let school = objects[indexPath.section]
            
            cell.labelAddress.textColor = UIColor.black
            cell.labelAddress.text = school.address
            
            cell.labelTitle.text = school.schoolName
            cell.labelTitle.textColor = UIColor.orange
            cell.viewContent.backgroundColor = UIColor.systemGroupedBackground
            cell.viewContent.layer.cornerRadius = 6.0
            cell.viewContent.layer.borderColor = UIColor.green.cgColor
            cell.viewContent.layer.borderWidth = 2.0
            return cell
        }
        
        
        return UITableViewCell()
        
    }
    
}
