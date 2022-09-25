//
//  SchoolPresenter.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit
/*
 
 Holds o
 
 */

class SchoolPresenter: NSObject, UITableViewDelegate, UITableViewDataSource {

    
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
    
}



/*
 
 Tableview Delegates
 
 */

extension SchoolPresenter  {

    func tableView(_ tableView: UITableView, heightForHeaderInSection:Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let objects = viewModelSchools {
            return objects.count
        }
        
        return 0;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSchool", for: indexPath) as? NYCSchoolTableViewCell
        
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
