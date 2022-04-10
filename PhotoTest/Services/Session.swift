//
//  Session.swift
//  PhotoTest
//
//  Created by Guzel Gubaidullina on 08.04.2022.
//

import Foundation

class Session {
    static let instance = Session()
    
    private init() {}
    var currentUser: User?
}
