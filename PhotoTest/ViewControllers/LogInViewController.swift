//
//  LogInViewController.swift
//  PhotoTest
//
//  Created by Guzel Gubaidullina on 07.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.borderWidth = 3
        logInButton.layer.borderColor = UIColor.orange.cgColor
        logInButton.layer.cornerRadius = 10
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let frame = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: frame.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWasShown(notification: )),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillBeHidden(notification: )),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "SegueShowLoadingScreenViewController":
            let authorized = login()
            if !authorized {
                showErrorAlert()
            } else {
                Session.instance.currentUser = User(name: "Admin", avatarPhotoName: "")
            }
            return authorized
        default:
            return true
        }
    }
    
    func login() -> Bool {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        return login == "admin" && password == "1234567890"
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Введены неверные данные пользователя",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

