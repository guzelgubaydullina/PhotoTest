//
//  LoadingScreenViewController.swift
//  PhotoTest
//
//  Created by Guzel Gubaidullina on 07.04.2022.
//

import UIKit

class LoadingScreenViewController: UIViewController {
    @IBOutlet weak var cameraImageView: UIImageView!
    @IBOutlet weak var firstStarImageView: UIImageView!
    @IBOutlet weak var secondStarImageView: UIImageView!
    @IBOutlet weak var thirdStarImageView: UIImageView!
    @IBOutlet weak var fourthStarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadingIconsAppearing()
    }
    
    func loadingIconsAppearing() {
        UIView.animateKeyframes(withDuration: 3,
                                delay: 0,
                                options: .calculationModeCubic,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                                       relativeDuration: 0.2,
                                                       animations: {
                                                        self.cameraImageView.alpha = 1.0
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
                                                       relativeDuration: 0.2,
                                                       animations: {
                                                        self.firstStarImageView.alpha = 1.0
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.4,
                                                       relativeDuration: 0.2,
                                                       animations: {
                                                        self.secondStarImageView.alpha = 1.0
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.6,
                                                       relativeDuration: 0.2,
                                                       animations: {
                                                        self.thirdStarImageView.alpha = 1.0
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.8,
                                                       relativeDuration: 0.2,
                                                       animations: {
                                                        self.fourthStarImageView.alpha = 1.0
                                                       })
                                    
                                },
                                completion: { finished in
                                    self.performSegue(withIdentifier: "SegueShowPhotoSelectionScreenViewController", sender: self)
                                })
    }
}

