//
//  SearchVC.swift
//  GitHubFollowers
//
//  Created by Deren Bozer on 6/27/24.
//

import UIKit

class SearchVC: UIViewController {

    /// Initialize UI Objects
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    /// Checks if the field is empty
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    /// Gets called only on the first appearance
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Background Color
        view.backgroundColor = .systemBackground
        
        /// Call Logo function
        configureLogoImageView()
        
        /// Call the text field function
        configureTextField()
        
        /// Call the Button function
        configureCallToActionButton()
        
        /// Function that enables keyboard dismissal
        createDismissKeyboardTapGesture()
    }
    
    
    /// Gets called every time the View appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    /// Function that enables tap to dismiss keyboard
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        
        view.addGestureRecognizer(tap)
    }
    
    
    /// Function for sending data with the button
    @objc func pushFollowerListVC() {
        /// Checks if the field is empty
        guard isUsernameEntered else {
            print("No Username")
            return
        }
        
        /// Creates the instance
        let followerListVC = FollowerListVC()
        
        /// Takes the text from the UITextField and assigns to username
        followerListVC.username = usernameTextField.text
        
        /// Sets the title
        followerListVC.title = usernameTextField.text
        
        /// Pushes the View to the Navigation controller
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    
    /// Function for adding the image
    func configureLogoImageView() {
        /// Equivalent to drag/drop UI item onto storyboard
        view.addSubview(logoImageView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        /// Loads image
        logoImageView.image = UIImage(named: "gh-logo")
        
        /// Constraints
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    /// Function for adding the text field
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        /// Sets the Delegate
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    /// Function for adding the Button
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        
        /// Calls the function for clicking the button
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        /// Constraints
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


/// Extension for Tapping the Return Key
extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        /// Calls the function for submitting the search
        pushFollowerListVC()
        return true
    }
}


#Preview {
    SearchVC()
}
