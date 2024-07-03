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
    
    /// Collection View
    var collectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    /// View Controller settings
    func configureViewController() {
        /// Background Color
        view.backgroundColor = .systemBackground
        
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
 
    /// Collection View
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    
    /// 3 Column layout settup
    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        
        return UICollectionViewFlowLayout()
    }
    
    
    /// Testing the network call
    func getFollowers() {
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
}
