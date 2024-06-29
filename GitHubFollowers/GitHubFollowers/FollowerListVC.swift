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
    }

}
