//
//  User.swift
//  PhotoTest
//
//  Created by Guzel Gubaidullina on 07.04.2022.
//

import UIKit

class User {
    var name: String
    var avatarPhotoName: String
    var avatarImage: UIImage?
    
    init(name: String, avatarPhotoName: String) {
        self.name = name
        self.avatarPhotoName = avatarPhotoName
    }
}

