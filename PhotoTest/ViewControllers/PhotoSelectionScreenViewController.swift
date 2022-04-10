//
//  PhotoSelectionScreenViewController.swift
//  PhotoTest
//
//  Created by Guzel Gubaidullina on 07.04.2022.
//

import UIKit

class PhotoSelectionScreenViewController: UIViewController {
    @IBOutlet weak var avatarImageContainerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var pickPhotoButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        pickPhotoButton.layer.borderWidth = 3
        pickPhotoButton.layer.borderColor = UIColor.orange.cgColor
        pickPhotoButton.layer.cornerRadius = 10
        
        saveButton.layer.borderWidth = 3
        saveButton.layer.borderColor = UIColor.green.cgColor
        saveButton.layer.cornerRadius = 10
        
        avatarImageView.applyShadowWithCorner(containerView: avatarImageContainerView,
                                              cornerRadius: 15)

    }
    
    @IBAction func pickPhotoButtonPressed(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(identifier: "UsersTableViewController") as? UsersTableViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension PhotoSelectionScreenViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            avatarImageView.image = image
            Session.instance.currentUser?.avatarImage = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
