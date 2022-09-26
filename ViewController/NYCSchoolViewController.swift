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
        self.presenter = SchoolPresenter(dataSourceSchools:NYCSchoolViewControllerConstants.dataSourceLocalSchools, dataSourceScores: NYCSchoolViewControllerConstants.dataSourceLocalScores)
        resetPresenter()
        self.navigationItem.title = self.presenter?.title
        let navItemRight = UIBarButtonItem(image: UIImage.init(named: NYCSchoolViewControllerConstants.refreshButtonImageName), style: .plain, target: self, action: #selector(refreshData(sender:)))
        self.navigationItem.rightBarButtonItem = navItemRight
    }
    
    func resetPresenter() {
        self.presenter?.delegate = self
        self.tableView.dataSource = self.presenter
        self.tableView.delegate = self.presenter
    }
}

extension NYCSchoolViewController {
    
    @objc func refreshData(sender:UIBarButtonItem) {
        sender.isEnabled = false
        
        self.presenter?.viewModelSchools = nil
        self.presenter?.viewModelScores = nil
        self.tableView.reloadData()
        // make network call to remote data source, if failure, revert back to local data
        SchoolDataSource.importSchoolDataRemoteSource { schools in
            SatScoreDataSource.importSatScoreDataRemoteSource { scores in
                
                if let schools = schools, let scores = scores {
                   
                    DispatchQueue.main.async {
                        self.presenter = SchoolPresenter(schools: schools, scores: scores)
                        self.resetPresenter()
                        self.tableView.reloadData()
                        sender.isEnabled = true
                    }
                   
                }  else { // failure case, revert back to loaded data
                    
                    DispatchQueue.main.async {
                        self.presenter = SchoolPresenter(dataSourceSchools: NYCSchoolViewControllerConstants.dataSourceLocalSchools, dataSourceScores: NYCSchoolViewControllerConstants.dataSourceLocalScores)
                        self.resetPresenter()
                        self.tableView.reloadData()
                        sender.isEnabled = true
                    }
                }
                
            }
        }
        
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

