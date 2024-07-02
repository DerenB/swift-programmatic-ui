//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Deren Bozer on 6/27/24.
//

import UIKit

class GFButton: UIButton {

    /// Initializer
    /// Have to override the initializer because it's a subclass of UIButton if doing custom
    override init(frame: CGRect) {
        /// Super calls the super class or parent
        super.init(frame: frame)
        
        /// Call button function
        configure()
    }
    
    
    /// Called when you initialize the Custom button in storyboard
    /// Needed even if you aren't using storyboards
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /// Custom initializer
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    
    /// Configure button properties
    private func configure() {
        /// Corner radius
        layer.cornerRadius = 10
        
        /// Title attributes
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        /// Use Auto Layout
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
}


#Preview {
    let button = GFButton(backgroundColor: .red, title: "Set Date")
    return button
}
