//
//  UsersTableViewCell.swift
//  PhotoTest
//
//  Created by Guzel Gubaidullina on 07.04.2022.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageContainerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    func bindUser(_ user: User) {
        if let avatarImage = user.avatarImage {
            avatarImageView.image = avatarImage
        } else {
            avatarImageView.image = UIImage(named: user.avatarPhotoName)
        }
        avatarImageView.applyShadowWithCorner(containerView: avatarImageContainerView,
                                              cornerRadius: 35)
        userNameLabel.text = user.name
    }
}
