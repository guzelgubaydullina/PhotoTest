//
//  ShadowView.swift
//  PhotoTest
//
//  Created by Guzel Gubaidullina on 07.04.2022.
//

import UIKit

extension UIImageView {
    func applyShadowWithCorner(containerView: UIView,
                               cornerRadius: CGFloat) {
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize(width: 1, height: 2)
        containerView.layer.shadowRadius = 5
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds,
                                                      cornerRadius: cornerRadius).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
