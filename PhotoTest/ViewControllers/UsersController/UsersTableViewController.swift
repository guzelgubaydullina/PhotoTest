//
//  UsersTableViewController.swift
//  PhotoTest
//
//  Created by Guzel Gubaidullina on 07.04.2022.
//

import UIKit

class UsersTableViewController: UITableViewController {
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentUser = Session.instance.currentUser {
            users.append(currentUser)
        }
        let bartSimpson = User(name: "Bart Simpson",
                                   avatarPhotoName: "bartSimpsonAvatarIcon")
        let lisaSimpson = User(name: "Lisa Simpson",
                                   avatarPhotoName: "lisaSimpsonAvatarIcon")
        let groot = User(name: "Groot",
                                   avatarPhotoName: "grootAvatarIcon")
        let rocket = User(name: "Rocket",
                                   avatarPhotoName: "rocketAvatarIcon")
        let pennywise = User(name: "Pennywise",
                                   avatarPhotoName: "pennywiseAvatarIcon")
        let rickSanchez = User(name: "Rick Sanchez",
                                   avatarPhotoName: "rickSanchezAvatarIcon")
        let mortySmith = User(name: "Morty Smith",
                                   avatarPhotoName: "mortySmithAvatarIcon")
        let chucky = User(name: "Chucky",
                                   avatarPhotoName: "chuckyAvatarIcon")
        let freddyKrueger = User(name: "Freddy Krueger",
                                   avatarPhotoName: "freddyKruegerAvatarIcon")
        
        users.append(contentsOf: [
            bartSimpson,
            lisaSimpson,
            groot,
            rocket,
            pennywise,
            rickSanchez,
            mortySmith,
            chucky,
            freddyKrueger
        ])
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell") as! UsersTableViewCell
        let user = users[indexPath.row]
        cell.bindUser(user)
        return cell
    }
}

