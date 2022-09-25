//
//  ViewController.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/23/22.
//

import UIKit

class NYCSchoolViewController: UIViewController {

    var presenter:SchoolPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "NYCSchools"
        // Do any additional setup after loading the view.
        self.presenter = SchoolPresenter(dataSourceSchools: "f9bf-2cp4-schools", dataSourceScores: "f9bf-2cp4-sat")
        
        self.tableView.dataSource = self.presenter
        self.tableView.delegate = self.presenter
        
    }


}

