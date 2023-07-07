//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by intern on 7/7/23.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        clipsToBounds = true //clipsToBounds: - subviews extending beyond the view's bounds will be clipped.
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
