//
//  NYCSatScoreViewController.swift
//  NYCSchools
//
//  Created by John Mulvey on 9/25/22.
//

import UIKit

class NYCSatScoreViewController: UIViewController, SatScorePresenterDelegate {

    @IBOutlet weak var tableView: UITableView!
    var presenter:SatScorePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let presenter = presenter {
            tableView.dataSource = presenter
            tableView.delegate = presenter
            self.navigationItem.title = self.presenter?.title
            presenter.delegate = self
        }
        
        // Do any additional setup after loading the view.
    }

}


extension NYCSatScoreViewController {
    
    func failAlert() {
        let alertView = UIAlertController(title: NYCSatScoreViewControllerConstants.errorDialogAlert, message:NYCSatScoreViewControllerConstants.errorEmulatorText , preferredStyle: .alert)
        
        alertView.addAction(UIAlertAction(title:NYCSatScoreViewControllerConstants.buttonOKText, style: .default, handler:nil))
        
        self.present(alertView, animated: true, completion: nil)
    }
    
    func satScoreOpenContactPage() {
        let alert = UIAlertController(title: NYCSatScoreViewControllerConstants.popOverTextContactMethod, message: "", preferredStyle: .actionSheet)
        
        if self.presenter?.emailURL != nil {
        
        alert.addAction(UIAlertAction(title: presenter?.popUpEmail, style: .default, handler: { UIAlertAction in
            
            if let email = self.presenter?.emailURL {
                if UIApplication.shared.canOpenURL(email) {
                    UIApplication.shared.open(email, options: [:], completionHandler: nil)
                } else {
                    self.failAlert()
                }
            }
            
        }))
            
        }
        
        if self.presenter?.phoneURL != nil {
        
        alert.addAction(UIAlertAction(title: presenter?.popUpPhone, style: .default, handler: { UIAlertAction in
         
            if let phone = self.presenter?.phoneURL {
                if UIApplication.shared.canOpenURL(phone) {
                    UIApplication.shared.open(phone, options: [:], completionHandler: nil)
                } else {
                    self.failAlert()
                }
            }
            
        }))
            
        }
        
        alert.addAction(UIAlertAction(title: NYCSatScoreViewControllerConstants.buttonCancelText, style: .destructive, handler: { UIAlertAction in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
