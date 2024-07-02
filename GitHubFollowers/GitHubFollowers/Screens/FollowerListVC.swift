//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Deren Bozer on 6/29/24.
//

import UIKit

class FollowerListVC: UIViewController {
    
    
    /// Username for passing the data
    var username: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Background Color
        view.backgroundColor = .systemBackground
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        /// Test network call
        NetworkManager.shared.getFollowers(for: username, page: 1) { (result) in
            
            switch(result) {
            case .success(let followers):
                print("Followers.count = \(followers.count)")
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
}
