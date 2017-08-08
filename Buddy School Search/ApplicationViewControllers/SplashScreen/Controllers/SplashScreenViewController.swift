//
//  SplashScreenViewController.swift
//  Buddy School Search
//
//  Created by AppStarter on 08.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import UIKit

final class SplashScreenViewController: UIViewController {

    private struct ViewConstants {
        static let duration = 1.0
        static let delay = 0.0
        static let startAlpha: CGFloat = 0.0
        static let middleAlpha: CGFloat = 0.5
        static let endAlpha: CGFloat = 1.0
        static let startScale = CGAffineTransform(scaleX: 4.0, y: 4.0)
        static let middleScale = CGAffineTransform(scaleX: 0.75, y: 0.75)
        static let endScale = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightBlue
        animateLogo()
    }
    
    private func animateLogo() {
        logoImageView.alpha = ViewConstants.startAlpha
        logoImageView.transform = ViewConstants.startScale
        
        UIView.animate(withDuration: ViewConstants.duration, delay: ViewConstants.delay, options: .curveEaseOut, animations: { [weak self] in
            self?.logoImageView.alpha = ViewConstants.middleAlpha
            self?.logoImageView.transform = ViewConstants.middleScale
        }) { finished in
            UIView.animate(withDuration: ViewConstants.duration, animations: { [weak self] in
                self?.logoImageView.alpha = ViewConstants.endAlpha
                self?.logoImageView.transform = ViewConstants.endScale
            }) { finished in
                // next step
            }
        }
    }
}
