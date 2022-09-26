//
//  ViewController.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class NYCSchoolViewController: UIViewController, SchoolPresenterDelegate {

    var presenter:SchoolPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.presenter = SchoolPresenter(dataSourceSchools: "f9bf-2cp4-schools", dataSourceScores: "f9bf-2cp4-sat")
        self.presenter?.delegate = self
        self.tableView.dataSource = self.presenter
        self.tableView.delegate = self.presenter
        self.navigationItem.title = self.presenter?.title
    }

}

extension NYCSchoolViewController {
    
    func schoolSelected(with school:SchoolViewModel, with scores:SatScoreViewModel) {
        
        print("school selected = \(school.schoolName), datafound = \(scores.satScoreDataFound)")
        
        let newvc = self.storyboard?.instantiateViewController(withIdentifier: "scoreDetailView") as? NYCSatScoreViewController
       
        if let newvc = newvc {
            newvc.presenter = SatScorePresenter(with: scores, with: school)
            self.navigationController?.pushViewController(newvc, animated: true)
        }
 
    }
}

