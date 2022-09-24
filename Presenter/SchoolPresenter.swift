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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let objects = self.viewModelSchools {
            return objects.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
