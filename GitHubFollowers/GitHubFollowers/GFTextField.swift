//
//  GFTextField.swift
//  GitHubFollowers
//
//  Created by Deren Bozer on 6/27/24.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    
    /// Called when you initialize the Custom button in storyboard
    /// Needed even if you aren't using storyboards
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        /// Use Auto Layout
        translatesAutoresizingMaskIntoConstraints = false
        
        /// Corner Radius & Border
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        /// Text Color
        textColor = .label
        
        /// Blinking cursor color
        tintColor = .label
        
        textAlignment = .center
        
        /// Font
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        /// Background color
        backgroundColor = .tertiarySystemBackground
        
        /// Auto Correction
        autocorrectionType = .no
        
        /// Placeholder
        placeholder = "Enter a username"
    }
}
