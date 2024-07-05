//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Deren Bozer on 7/2/24.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    /// Placeholder image
    let placeholderImage = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        /// Corner Radius
        /// Clips to bounds makes the image have a rounded corner
        layer.cornerRadius = 10
        clipsToBounds = true
        
        /// Placeholder Image
        image = placeholderImage
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(from urlString: String) {
        
    }
}
